class SpotsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :verify_slack_token, except: [:index, :show]

  # GET /spots
  def index
    @grouped_spots =
    if params[:name]
      Spot.where(user_name: params[:name]).to_a.group_by_day(&:created_at).sort.reverse
    elsif params[:tag]
      Spot.where("'#{params[:tag]}' = ANY (tags)").to_a.group_by_day(&:created_at).sort.reverse
    else
      Spot.all.to_a.group_by_day(&:created_at).sort.reverse
    end

    respond_to do |format|
      format.html
    end
  end

  # GET /spots/user
 def user
  if params[:command].present?
    @spots = Spot.where(user_id: params[:user_id]).order(id: :desc)
    render plain: "*Here are your past spots:* \n" + @spots.map{
      |p|  "#{p.id}. " + p.text.delete("\n")
    }.join("\n")
  else
    render nothing: true, status: :forbidden
  end
 end

  # POST /spots
  def create
    render nothing: true, status: :ok and return unless responder.respond?
    @spot = Spot.new(spot_params)
    if params[:text].present? && @spot.save
      render plain: responder.response.to_s +  ' .See your message on: ' + "#{root_url}#spot-#{@spot.id}"
    else
      render plain: "Please add a message to your command: /spotme [message]"
    end

  end

  private

    def spot_params
      params.permit(:user_id, :user_name, :text, :channel_name)
    end

    # Setup slack responder
    def responder
      @responder ||= Slack::Response.new(params[:text])
    end

    def verify_slack_token
      render nothing: true, status: :forbidden and return unless Slack::TOKENS.include?(params[:token])
    end
end

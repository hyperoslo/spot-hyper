class SpotsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :verify_slack_token, except: [:index, :show]

  # GET /spots
  def index
    @spots = Spot.all.order("RANDOM()")
    respond_to do |format|
      format.html
    end
  end

  # GET /spots/user
 def user
  if params[:command].present?
    @spots = Spot.where(user_id: params[:user_id]).order(id: :desc)
    render text: "*Here are your past spots:* \n" + @spots.map{
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
      render text: responder.response.to_s
    else
      render text: "Please add a text command: /say [text]"
    end

  end

  private

    # Only allow a trusted parameter "white list" through.
    def spot_params
      params.permit(:user_id, :user_name, :text)
    end

    # Setup slack responder
    def responder
      @responder ||= Slack::Response.new(params[:text])
    end

    def verify_slack_token
      render nothing: true, status: :forbidden and return unless Slack::TOKENS.include?(params[:token])
    end
end

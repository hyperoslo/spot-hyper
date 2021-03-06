class SpotsController < ApplicationController
  include VerifySlackToken
  before_filter :get_client_ip, only: [:index, :awesome]

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

  def awesome
    @grouped_spots = Spot.unscoped.where(awesome: true).to_a.group_by_day(&:created_at).sort.reverse
    respond_to do |format|
      format.html { render :index }
    end
  end

  def destroy
    if params[:text].present?
      @spot = Spot.find_by(id: params[:text])
      if @spot and @spot.owner?(params[:user_id].to_i) and @spot.destroy
        render plain: "Deleted your spot##{@spot.id}: #{@spot.text}"
      else
        render plain: "Your spot: #{params[:text]} not found or you are not the owner."
      end
    else
      render plain: "Please add your spot id to your command: /spotdel [id]"
    end
  end

  # POST /spots
  def create
    if params[:command] == "/spotme"
      render nothing: true, status: :ok and return unless responder.respond?
      @spot = Spot.new(slack_params)
      if params[:text].present? && @spot.save
        render plain: "#{responder.response}. See your message on #{root_url}#spot-#{@spot.id}"
      else
        render plain: "Please add a message to your command: /spotme [message]"
      end
    elsif params[:command] == "/spotdel"
      destroy
    else
      render plain: "Command not found", status: :ok
    end
  end

  private
  def get_client_ip
    @ip = GetIP.new(request).remote_ip
  end
end

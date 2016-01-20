class VotesController < ApplicationController
  before_action :set_spot
  before_filter :get_client_ip, only: [:index, :awesome]

  def create
    if @spot.voted?(get_client_ip)
      destroy
    else
      @vote = @spot.votes.create(ip: get_client_ip)
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @vote = @spot.votes.where(ip: get_client_ip).first
    if @vote and @vote.destroy
      respond_to do |format|
        format.js { render :create }
      end
    end
  end

  private

  def set_spot
    @spot = Spot.find_by(id: params[:spot_id])
  end

  def get_client_ip
    @ip = GetIP.new(request).remote_ip
  end
end

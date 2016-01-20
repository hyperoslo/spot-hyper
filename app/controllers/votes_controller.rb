class VotesController < ApplicationController
  before_action :set_spot

  def create
    if @spot.voted?(request.ip)
      destroy
    else
      @vote = @spot.votes.create(ip: request.ip)
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @vote = @spot.votes.where(ip: request.ip).first
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
end

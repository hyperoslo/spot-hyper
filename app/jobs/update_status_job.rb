class UpdateStatusJob < ApplicationJob
  def perform(spot)
    ActionCable.server.broadcast "spots",
      message: SpotsController.render(partial: 'spots/spot', locals: { spot: spot })
  end
end

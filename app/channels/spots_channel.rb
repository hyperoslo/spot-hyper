class SpotsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "spots"
  end

  def unsubscribed
    stop_all_streams
  end
end

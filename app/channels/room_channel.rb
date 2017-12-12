class RoomChannel < ApplicationCable::Channel
	include SessionsHelper

  def subscribed
    # stream_from "some_channel"
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
end

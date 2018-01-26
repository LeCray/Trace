class DataStreamChannel < ApplicationCable::Channel
	include SessionsHelper
  def subscribed
    # stream_from "some_channel"
    stream_from "data_stream_channel_#{params[:pathID]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

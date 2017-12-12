class MessagesController < ApplicationController
	include SessionsHelper
	 before_action :get_messages

	def index

	end

	def create 

		message = current_driver.messages.build(message_params)
	    if message.save
	   		ActionCable.server.broadcast 'room_channel',
                                   content:  message.content,
                                   username: message.driver.first_name
          head :ok
	    end
	end

	private

    def get_messages
      @messages = Message.for_display
      @message  = current_driver.messages.build
    end

    def message_params
      params.require(:message).permit(:content)
    end

end

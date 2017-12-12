class MessagesController < ApplicationController
	include SessionsHelper
	 before_action :get_messages

	def index

	end

	def create 

		message = current_driver.messages.build(message_params)
	    if message.save
	   		ActionCable.server.broadcast 'room_channel',
                                   message: render_message(message)
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

    def render_message(message)
      render(partial: 'message', locals: { message: message })
    end
end

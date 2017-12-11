module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	identified_by :current_driver

    def connect
      self.current_driver = find_verified_driver
    end

    private
      def find_verified_driver
        if verified_driver = Driver.find_by(id: cookies.encrypted[:driver_id])
          verified_driver
        else
          reject_unauthorized_connection
        end
      end
  end
end

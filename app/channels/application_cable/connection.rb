module ApplicationCable
  class Connection < ActionCable::Connection::Base
  #channelでverify_userが使えるようにする
  identified_by :verify_user, :user_ip

    def connect
      self.verify_user
    end

    protected
    def find_verified_user
      verified_user = User.find_by(id: env['warden'].user.id)
      return reject_unauthorized_connection unless verified_user
      verified_user
    end

    def session
      cookies.encrypted[Rails.application.config.session_options[:key]]
    end
  end
end
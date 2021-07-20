module ChatsHelper
  def user_ip
    request.remote_ip.gsub(/[^\d]/, "").to_i
  end

  def verify_user
    User.first
  end
  
end

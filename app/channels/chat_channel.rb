class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
    # stream_for user_ip.id
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
      if data["message"]
      Chat.create!(
        user_ip: data["user_ip"].to_i,
        user_id: data["admin_id"].to_i ,
        message: data["message"],
        sender: data["sender"],
        spot_id: data["spot_id"] 
      )
    ActionCable.server.broadcast 'chat_channel', 
          user_ip: data["user_ip"].to_i,
          user_id: data["admin_id"].to_i ,
          message: data["message"],
          sender: data["sender"],
          spot_id: data["spot_id"] 

    end
  end
  
end
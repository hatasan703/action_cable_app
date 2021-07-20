class UsersController < ApplicationController

  def index
    @admin = User.first
    @chats = Chat.order(created_at: :desc)
  end

  def user_chat
    chat = Chat.find(params[:id])
    @spot = Spot.find(chat.spot_id)
    @user_ip = chat.user_ip
    @admin_id = chat.user_id
    @chats_by_myself = Chat.where(spot_id: @spot.id, user_ip: @user_ip, user_id: @admin_id, sender: 'user')
    @chats_by_other = Chat.where(spot_id: @spot.id, user_ip: @user_ip, user_id: @admin_id, sender: 'admin')
    @chats = @chats_by_myself.or(@chats_by_other)#リレーションオブジェクト達を結合する
    @chats = @chats.order(:created_at)
  end
end

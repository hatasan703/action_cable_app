class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])

    @user_ip = request.remote_ip.gsub(/[^\d]/, "").to_i
    @admin_id = User.first.id
    @chats_by_myself = Chat.where(spot_id: @spot.id, user_ip: @user_ip, user_id: @admin_id, sender: 'user')
    @chats_by_other = Chat.where(spot_id: @spot.id, user_ip: @user_ip, user_id: @admin_id, sender: 'admin')
    @chats = @chats_by_myself.or(@chats_by_other)#リレーションオブジェクト達を結合する
    @chats = @chats.order(:created_at)
  end
end

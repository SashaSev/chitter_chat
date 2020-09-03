class RoomsChannel < ApplicationCable::Channel

  def subscribed
    @user_id = params[:user]
    user = UsersController.new
    user.connected(params)
    @room = Room.find_by(id: params[:room])
    stream_for @room
  end

  def received(data)
    @notification_room = NotificationRoom.find_by(user_id: @user_id)
    # NotificationChannel.broadcast_to(@notification_room, { room: @room })
    RoomsChannel.broadcast_to(@room, { room: @room, users: @room.users, messages: @room.messages })
  end

  def unsubscribed
    user = UsersController.new
    user.disconnected(params)
    stop_all_streams
  end
end

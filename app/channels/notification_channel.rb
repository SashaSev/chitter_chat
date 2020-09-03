class NotificationChannel < ApplicationCable::Channel
  def subscribed
    # NotificationRoom.create_note(params[:not_id])
    @room = NotificationRoom.find_by(user_id: params[:user_id])

    stream_for @room

    @room.unseen
  end

  def receive(data)
    Notification.all.to_a.each(&:set_seen)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

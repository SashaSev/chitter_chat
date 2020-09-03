class Notification < ApplicationRecord
  after_create :broadcast
  belongs_to :notification_room

  def broadcast
    NotificationChannel.broadcast_to(notification_room, self)
  end

  def set_seen
    update(viewed: true)
  end
end

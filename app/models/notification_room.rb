class NotificationRoom < ApplicationRecord
  belongs_to :user
  has_many :notifications

  def unseen
    Notification.where(notification_room_id: self, viewed: false).each(&:broadcast)
  end

  def create_notification(message)
    Notification.create(notification_room: self, message: message)
  end
end

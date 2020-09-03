class User < ApplicationRecord
  has_many :messages
  has_and_belongs_to_many :rooms
  has_many :rooms, through: :messages
  has_many :notifications
  has_secure_password
  validates :username, uniqueness: true, presence: true
  after_create do
    NotificationRoom.create(user: self)
  end
  has_one :notification_room
end

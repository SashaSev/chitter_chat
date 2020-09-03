class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  after_create do
    text = "You have message in #{room.id}"
    NotificationJob.set(wait: 5.seconds).perform_later(id, text)
    RoomsChannel.broadcast_to(room, {
        room: RoomSerializer.new(room),
        users: UserSerializer.new(room.users),
        messages: MessageSerializer.new(room.messages)
    })
  end
  # def broadcast
  # end
end
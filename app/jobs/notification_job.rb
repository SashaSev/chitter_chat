class NotificationJob < ApplicationJob
  queue_as :default

  def perform(message_id, message)

    messages = Message.find(message_id)
    unless messages.viewed
      room = messages.room
      p room.users
      # room.users.each do |user|
      #   # p user
      #   # if messages.user.id != user.id
      #   #
      #   #   user.notification_room.create_notification(message)
      #   # end
      # end
      #
      #
    end
    # Do something later
  end
end

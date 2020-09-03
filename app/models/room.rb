class Room < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages

  def create_message(content, user_id, room_id)
    message = Message.new(content: content, user_id: user_id, room_id: room_id)
    if message.save
    end
  end

  # def unseen
  #   Message.where(room_id: self, viewed: false).each(&:broadcast)
  # end

end

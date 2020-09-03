class MessagesController < ApplicationController
  def index
    messages = Message.all
    render json: messages
  end

  def create
    message = Message.new(message_params)
    puts 'successfully saved a message!' if message.save
    render json: MessageSerializer.new(message)
  end

  private


  def message_params
    params.require(:message).permit(:content, :user_id, :room_id, :viewed)
  end
end
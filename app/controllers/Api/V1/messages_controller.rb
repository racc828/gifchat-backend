class Api::V1::MessagesController < ApplicationController


  def create
    message = Message.create(message_params)
    chat = Chat.find_by(id: params[:chat_id])
    chat.messages << message
    chatJson = {
      name: chat.name,
      category: chat.category,
      messages: chat.messages,
      id: chat.id
    }
    render json: chatJson
  end

  private

  def message_params
    params.require(:message).permit(:chat_id, :message_text)
  end

end

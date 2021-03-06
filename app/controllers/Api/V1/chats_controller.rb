class Api::V1::ChatsController < ApplicationController

  def index
    chats = Chat.all
    user = User.find(current_user.id)
    myChats = user.chats
    chatsJson = {
      allChats: chats,
      myChats: myChats
    }
    render json: chatsJson
  end

  def create
    chat = Chat.create(chat_params)
    user = User.find(current_user.id)
    user.chats << chat
    render json: chat
  end

  def show
    chat = Chat.find_by(id: params[:id])
    chatJson = {
      name: chat.name,
      category: chat.category,
      messages: chat.messages,
      id: chat.id
    }
    render json: chatJson
  end

  private

  def chat_params
    params.require(:chat).permit(:name, :category)
  end

end

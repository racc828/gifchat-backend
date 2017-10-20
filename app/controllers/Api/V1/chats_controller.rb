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

  private

  def chat_params
    params.require(:chat).permit(:name, :category)
  end

end

class ChatroomsController < ApplicationController
 def show
   @home = Home.find(params[:id])
   @chatroom = Chatroom.find(@home.id)
   @message = Message.new
 end
end

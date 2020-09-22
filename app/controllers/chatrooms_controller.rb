class ChatroomsController < ApplicationController

 def show
   @home = current_user.home
   @chatroom = Chatroom.find(params[:id])
   @message = Message.new
 end
end

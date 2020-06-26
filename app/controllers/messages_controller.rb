class MessagesController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.json
      end
    else
      redirect_to "/rooms/#{@message.room_id}", alert: "メッセージを入力してください"
    end
  end

  def message_params
    params.require(:message).permit(:user_id, :message, :room_id).merge(user_id: current_user.id)
  end

end

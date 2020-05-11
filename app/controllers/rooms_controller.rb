class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.all
  end

  def create
    @room = Room.create #user_show内のformから受け取ったパラメータを受け取りインスタンスに格納
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id) #ログインしているユーザーに対するentory
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id)) #f相手方のentry
    redirect_to "/rooms/#{@room.id}" #createと同時にルームへリダイレクトする
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id,room_id: @room.id).present? #現在ログインしているユーザーのidとそれに紐づくメッセージ
      @messages = @room.messages #roomに紐づいたメッセージをメッセージインスタンスに格納
      @message = Message.new #新しくメッセージを作成する場合
      @entries = @room.entries #ユーザー情報を表示させるため
    else
      redirect_back(fallback_location: root_path)
    end
  end
end

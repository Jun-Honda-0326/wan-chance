class UsersController < ApplicationController

  before_action :set_user

  def show
    if user_signed_in?
      @currentUserEntry=Entry.where(user_id: current_user.id) # 現在ログインしているユーザー情報
      @userEntry=Entry.where(user_id: @user.id) #相手方のユーザー情報
      unless @user.id == current_user.id #現在ログインしてるユーザーではない時
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id then #相手方とのルームが既に作成されているか
              @isRoom = true 
              @roomId = cu.room_id #room_idを特定
            end
          end
        end
        if @isRoom
        else #roomがまだ作成されていない場合
          @room = Room.new #新規roomの作成
          @entry = Entry.new
        end
      end
    end
  end

  def set_user
    @user = User.find(params[:id])
    @name = @user.name
    @posts = @user.posts.page(params[:page]).per(5).order("created_at DESC")
  end

end

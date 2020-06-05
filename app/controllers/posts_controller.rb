class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]

  def index 
    if params[:tag_id]
      @select_tag = Tag.find(params[:tag_id])
      @posts = Post.from_tag(params[:tag_id]).order("created_at DESC").page(params[:page]).per(5)
    else
      @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    end 
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    tag_list = params[:post][:tagname].split("/")
    if @post.save&@post.save_posts(tag_list)
      redirect_to root_path, notice: "投稿が完了しました"      
    else
      redirect_to new_post_path, alert: "メッセージと写真は必須です"
    end 
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path, notice: "投稿の削除が完了しました"
  end

  def search
    @posts = Post.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(5)
  end
  


  private
  def post_params
    params.require(:post).permit(:text, :image, tag_ids:[]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end


end

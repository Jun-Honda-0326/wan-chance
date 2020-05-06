class PostsController < ApplicationController

  def index 
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:text, :image)
  end


end

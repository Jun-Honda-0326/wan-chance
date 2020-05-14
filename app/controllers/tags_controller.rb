class TagsController < ApplicationController    

def show
  @tag = Tag.find(params[:id])
  @posts = @tag.posts.page(params[:page]).per(5).order("created_at DESC")
end



end

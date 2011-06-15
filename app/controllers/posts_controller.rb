class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  # New a empty Post object
  def new
    @post = Post.new
  end
  
  # sending by new.html.erb, initial a new post object and save it, then redirect to indext page
  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to board_posts_path
    else
      redirect_to new_post_path
    end
  end
  
  # By using find method to find the data
  def show
    @post = Post.find(params[:id])
  end
  
  # 1. Find the data 2. Update to database
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to post_path(@post)
    else
      redirect_to edit_post_path(@post)
    end
  end
  
  # delete the data  you choice
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end 
end

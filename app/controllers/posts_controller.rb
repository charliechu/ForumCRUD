class PostsController < ApplicationController
  
  before_filter :find_board, :only => [:index, :create, :edit, :update, :destroy]
  before_filter :find_post, :only => [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end
  
  # New a empty Post object
  def new
    @post = Post.new
  end
  
  # sending by new.html.erb, initial a new post object and save it, then redirect to indext page
  def create
    @post = @board.posts.build(params[:post])

    if @post.save
      redirect_to board_posts_path(@board)
    else
      render :action => "new"
    end
  end
  
  # By using find method to find the data
  def show

  end
  
  # 1. Find the data 2. Update to database
  def edit

  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to board_post_path(@board, @post)
    else
      render :action => "edit"
    end
  end
  
  # delete the data  you choice
  def destroy
    @post.destroy

    redirect_to board_posts_path(@board)
  end 
  
  protected
  
  def find_board
    @board = Board.find(params[:board_id])
  end
  
  def find_post
    @post = Post.find(params[:id])
  end
end

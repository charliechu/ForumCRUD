class PostsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  before_filter :find_board, :only => [:index, :create, :edit, :update, :destroy]
  before_filter :find_post, :only => [:show, :edit, :update, :destroy]
  before_filter :find_category_ids, :only => [:show, :edit]
  before_filter :require_is_admin_or_poster, :except => [:index, :show]
  def index
    # Find post by board and select to all
    @posts = @board.posts.all
    @users =  User.all
  end
  
  # New a empty Post object
  def new
    @post = Post.new
  end
  
  # sending by new.html.erb, initial a new post object and save it, then redirect to indext page
  def create
    @post = @board.posts.build(params[:post])
    @post.user = current_user
    if @post.save
      flash[:notice] = "新增成功"
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
      flash[:notice] = "更新成功"
      redirect_to admin_post_path(@board, @post)
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
  
  def require_is_admin_or_poster
    unless user_signed_in? && (current_user.is_admin? || @post.user == current_user)
      flash[:notice] = "login fail"
      redirect_to root_path
    end
  end
  
  def find_category_ids
    @category_ids = @post.category_ids
  end
  
  def find_board
    @board = Board.find(params[:board_id])
  end
   
  def find_post
    @post = Post.find(params[:id])
  end
end

class PostsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  before_filter :find_board, :only => [:index, :create, :edit, :update, :destroy]
  before_filter :find_post, :only => [:show, :edit, :update, :destroy]
  before_filter :find_category_ids, :only => [:show, :edit]
  before_filter :require_is_admin_or_poster, :only => [:edit, :update, :destroy]
  
  def index
    @users = User.all
    if params[:recent] == "1"
      @posts = @board.posts.recent.paginate(:page => params[:page], :per_page => 5)
    else
      @posts = @board.posts.newest.paginate(:page => params[:page], :per_page => 5)
    end
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
      flash[:notice] = "新增失敗"
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
      redirect_to board_post_path(@board, @post)
    else
      flash[:notice] = "更新失敗"
      render :action => "edit"
    end
  end
  
  # delete the data  you choice
  def destroy
    @post.destroy
    flash[:notice] = "刪除成功"
    redirect_to board_posts_path(@board)
  end 
  
  protected
  
  def require_is_admin_or_poster
    unless user_signed_in? && (current_user.is_admin? || @post.user == current_user)
      flash[:notice] = "權限不足"
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

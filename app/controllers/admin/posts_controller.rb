class Admin::PostsController < ApplicationController
  before_filter :require_is_admin
  before_filter :find_post, :only => [:show, :edit, :update, :destroy]
  before_filter :find_category_ids, :only => [:show, :edit]
  
  def index
    flash[:notice] = "管理者您好"
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "新增完成"
      redirect_to admin_posts_path
    else
      render :action => new
    end
  end
  
  def show
    
  end

  def edit
    
  end
  
  def update
    if @post.update_attributes(params[:post])
      flash[:notice] = "更新完成"
      redirect_to admin_posts_path
    else
      render :action => "edit"
    end    
  end
  
  def destroy
    @post.destroy
    redirect_to admin_posts_path
  end
  
  protected
  
  def find_category_ids
    @category_ids = @post.category_ids
  end
  
  def find_post
    @post = Post.find(params[:id])
  end
end

class Admin::BoardsController < ApplicationController
  before_filter :require_is_admin
  before_filter :find_board, :only => [:show, :edit, :update, :destroy]
    
  def index
    @boards = Board.all
  end
  
  def new
    @board = Board.new
  end
  
  def create
    @board = Board.new(params[:board])
    if @board.save
      redirect_to admin_boards_path
    else
      render :action => "new"
    end
  end
  
  def show

  end
  
  def edit
    
  end
  
  def update
    @admin = User.find(current_user).is_admin
    if @board.update_attributes(params[:board]) && @admin
      redirect_to admin_boards_path
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @board.destroy
    redirect_to admin_boards_path
  end
  
  protected
  
  def require_is_admin
    unless user_signed_in? && current_user.is_admin?
      flash[:notice] = "login fail"
      redirect_to root_path
    end
  end
  
  def find_board
    @board = Board.find(params[:id])
  end
end

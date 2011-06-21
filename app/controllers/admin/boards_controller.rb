class Admin::BoardsController < ApplicationController
  before_filter :require_is_admin
  before_filter :find_board, :only => [:show, :edit, :update, :destroy]
    
  def index
    flash[:notice] = "管理者您好"
    @boards = Board.all
  end
  
  def new
    @board = Board.new
  end
  
  def create
    @board = Board.new(params[:board])
    if @board.save
      flash[:notice] = "新增成功"
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
    if @board.update_attributes(params[:board])
      flash[:notice] = "更新成功"
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
  
  def find_board
    @board = Board.find(params[:id])
  end
end

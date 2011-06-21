class BoardsController < ApplicationController
  before_filter :find_board, :only => [:show, :edit, :update, :destroy]
  before_filter :require_is_admin, :except => [:index, :show]
  
  def index
    @boards = Board.all
  end
  
  # New a empty Board object
  def new
    @board = Board.new
  end
  
  # sending by new.html.erb, initial a new post object and save it, then redirect to indext page
  def create
    @board = Board.new(params[:board])
    if @board.save
      flash[:notice] = "新增成功"
      redirect_to boards_path
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
    if @board.update_attributes(params[:board])
      flash[:notice] = "更新成功"
      redirect_to boards_path
    else
      flash[:notice] = "更新失敗"
      render :action => "edit"
    end
  end
  
  # delete the data  you choice
  def destroy
    @board.destroy
    flash[:notice] = "刪除失敗"
    redirect_to boards_path
  end
  
  #Frequency Use
  protected 
  
  def find_board 
    @board = Board.find(params[:id])
  end
end

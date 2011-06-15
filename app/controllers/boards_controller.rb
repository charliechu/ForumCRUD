class BoardsController < ApplicationController
  before_filter :find_board, :only => [:show, :edit, :update, :destroy]
  
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
      redirect_to board_path(@board)
    else
      render :action => new
      redirect_to new_board_path
    end
  end
  # By using find method to find the data
  def show
    @board = Board.find(params[:id])
  end
  
  # 1. Find the data 2. Update to database
  def edit

  end

  def update
    if @board.update_attributes(params[:board])
      redirect_to board_path(@board)
    else
      render :action => edit
    end
  end
  
  # delete the data  you choice
  def destroy
    @board.destroy
    redirect_to boards_path
  end
  
  #Frequency Use
  protected 
  
  def find_board 
    @board = Board.find(params[:id])
  end
end

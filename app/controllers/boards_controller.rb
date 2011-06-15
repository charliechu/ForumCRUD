class BoardsController < ApplicationController
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
      redirect_to new_board_path
    end
  end
  # By using find method to find the data
  def show
    @board = Board.find(params[:id])
  end
  
  # 1. Find the data 2. Update to database
  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update_attributes(params[:board])
      redirect_to board_path(@board)
    else
      redirect_to edit_board_path(@board)
    end
  end
  
  # delete the data  you choice
  def destroy
    @board = Board.find(params[:id])
    @board.destroy

    redirect_to boards_path
  end
end

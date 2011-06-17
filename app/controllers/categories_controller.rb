class CategoriesController < ApplicationController

  before_filter :find_Category, :only => [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to categories_path
    else
      render :action => "new"
    end 
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def edit
    
  end
  
  def update

		if @category.update_attributes(params[:category])
		  redirect_to categories_path
		else
		  render :action => "edit" 
		end
  end
  
  def destroy

    @category.destroy
    redirect_to categories_path
  end
  
  protected 
  def find_Category
    @category = Category.find(params[:id])
  end
  
end

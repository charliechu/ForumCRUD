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
      flash[:notice] = "新增成功"
      redirect_to categories_path
    else
      flash[:notice] = "新增失敗"
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
      flash[:notice] = "更新成功"
      redirect_to categories_path
    else
      render :action => "edit" 
    end
  end
  
  def destroy
    @category.destroy
    flash[:notice] = "刪除成功"
    redirect_to categories_path
  end
  
  protected 
  def find_Category
    @category = Category.find(params[:id])
  end
  
end

class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @categories = Category.page(params[:page]).per(10)
    @category = Category.new

  end

  def create
    @category = Category.new(category_params) 
    if @category.save
      flash[:alert] = "Category was successfully saved"
      redirect_to admin_categories_path
    else
      
      @categories = Category.all
      render :index
    end
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end

  
end

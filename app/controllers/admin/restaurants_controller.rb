class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:alert] = "restaurant was successfully created"
      redirect_to root_path
    else
      flash[:alert] = "restaurant was failed to create"
      render :new

  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description)
  end



end

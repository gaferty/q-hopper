class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :new, :create]
  def index
    @restaurants = Restaurant.all
  end

  def show

  end

  def new

  end

  def create

  end

  def destroy

  end

  private

  def set_restaurant
    @restaurant= Restaurant.find(params[:id])
  end
end

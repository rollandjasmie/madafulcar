class PicturesController < ApplicationController
  before_action :authenticate_user!
  def create
    @car = Car.find(params[:car_id])
    @car.pictures.attach(params[:pictures])
    redirect_to(car_path(@car))
  end
end

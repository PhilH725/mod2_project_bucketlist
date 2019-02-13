
class CarsController < ApplicationController

  layout 'bucketlist_header'

  # def index
  # end
  #
  # def show
  # end
  #
  def new
    @car = Car.new
    @user = logged_user
  end
  #
  def create

    @car = Car.new(car_params)
    @car.images.attach(params[:car][:images])
      if @car.save
        redirect_to user_cars_path(logged_user)
      else
        render :new
      end
  end

  # def edit
  # end
  #
  # def update
  # end

  # def destroy
  # end

  private

  def car_params
    params.require(:car).permit(:make, :model, :color, :year, :mileage, :user_id, images: [])
  end

end

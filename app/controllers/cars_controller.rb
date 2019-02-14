
class CarsController < ApplicationController

  layout 'bucketlist_header'

  before_action :get_car, only: [:show]

  # def index
  # end
  #
  def show
  end
  #
  def new
    @car = Car.new
    @user = logged_user
    # 5.times { @car.images.build }
  end
  #
  def create
    #byebug
    @car = Car.new(car_params)
    # @car.images.attach(params[:car][:images])
      if @car.save
        redirect_to car_path(@car)
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

  def get_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:make, :model, :color, :year, :mileage, :user_id, :avatar, images: [])
  end

end

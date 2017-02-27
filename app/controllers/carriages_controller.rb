class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @carriages = Carriage.all
  end

  def show
  end

  def new
    @carriage = Carriage.new
  end

  def create
    @carriage = Carriage.new(carriage_params)

    if @carriage.save
      redirect_to carriage_path(@carriage)
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to carriage_path(@carriage)
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to carriages_path
  end

  private

  def carriage_params
    params.require(:carriage).permit(:type, :number_seat_place, :number_top_place, :number_bottom_place, :number_side_bottom_place, :number_side_top_place, :train_id)
  end

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

end

class Admin::CarriagesController < Admin::BaseController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

  def index
    @carriages = Carriage.all
  end

  def show
    @carriage = Carriage.find(params[:id])
  end

  def new
    @carriage = Carriage.new
  end

  def create
    @carriage = @train.carriages.new(carriage_params)

      if @carriage.save
        redirect_to  admin_trains_path(@train)
      else
        render :new
      end

    end

    def edit
    end

    def update
    if @carriage.update(carriage_params)
      redirect_to admin_train_carriages_path(@carriage)
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to admin_train_carriages_path(@carriage)
  end

  private

  def carriage_params
    params.require(:carriage).permit(:type, :number_seat_place, :number_top_place, :number_bottom_place, :number_side_bottom_place, :number_side_top_place, :train_id)
  end

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

end

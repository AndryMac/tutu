class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_position_order, :update_time]
  before_action :set_route, only: [:update_position_order, :update_time]

  # GET /railway_stations
  # GET /railway_stations.json
  def index
    @railway_stations = RailwayStation.all
  end

  # GET /railway_stations/1
  # GET /railway_stations/1.json
  def show
  end

  # GET /railway_stations/new
  def new
    @railway_station = RailwayStation.new
  end

  # GET /railway_stations/1/edit
  def edit
  end

  # POST /railway_stations
  # POST /railway_stations.json
  def create
    @railway_station = RailwayStation.new(railway_station_params)

      if @railway_station.save
         redirect_to admin_railway_station_path(@railway_station)
      else
        render :new
      end

  end

  # PATCH/PUT /railway_stations/1
  # PATCH/PUT /railway_stations/1.json
  def update

      if @railway_station.update(railway_station_params)
        redirect_to admin_railway_station_path(@railway_station)
      else
        render :edit

      end

  end

  def update_time

    @railway_station.update_time(@route, params[:arrival_time], params[:departure_time])
    redirect_to @route
  end


  def update_position_order
    @railway_station.update_position(@route, params)
    redirect_to routes_path(@route)
  end





  # DELETE /railway_stations/1
  # DELETE /railway_stations/1.json
  def destroy
    @railway_station.destroy

      redirect_to admin_railway_stations_url


  end

  private

    def set_route
      @route = Route.find(params[:route_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def railway_station_params
      params.require(:railway_station).permit(:title)
    end
end

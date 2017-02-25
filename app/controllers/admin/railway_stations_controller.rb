class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy,
                                             :update_position, :update_time]
  
  add_breadcrumb I18n.t('admin.control_panel.index.title'), [:admin,:control_panels_index]
  add_breadcrumb I18n.t('admin.railway_stations.index.title'), [:admin,:railway_stations], only: [:show, :new, :edit]
  
  def index
    add_breadcrumb t('.title')

    @railway_stations = RailwayStation.all
  end

  def show
    add_breadcrumb t('.title') + " #{@railway_station.title}", [:admin, :railway_station]
  end

  def new
    add_breadcrumb t('.title'), [:new_admin, :railway_station]

    @railway_station = RailwayStation.new
  end

  def edit
    add_breadcrumb t('.title') + " #{@railway_station.title}", [:edit_admin, :railway_station]
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)

    if @railway_station.save
      redirect_to [:admin, @railway_station], :notice => get_text_notice
    else
      render :new
    end
  end

  def update
    if @railway_station.update(railway_station_params)
      redirect_to [:admin, @railway_station], :notice => get_text_notice
    else
      render :edit
    end
  end

  def destroy
    @railway_station.destroy
    redirect_to admin_railway_stations_path, :notice => get_text_notice
  end

  def update_position
    @route = Route.find(params[:route_id])
    @railway_station.update_position(@route, params[:position])
    redirect_to [:admin, @route]
  end

  def update_time
    @route = Route.find(params[:route_id])
    @railway_station.update_time(@route, params[:arrival], params[:departure])
    redirect_to [:admin, @route]
  end

  private

    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    def get_text_notice
      t('.notice', action: @railway_station.title.to_s)
    end

    def railway_station_params
      params.require(:railway_station).permit(:title)
    end
end

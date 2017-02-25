class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  add_breadcrumb I18n.t('admin.control_panel.index.title'), [:admin,:control_panels_index]
  add_breadcrumb I18n.t('admin.routes.index.title'), [:admin,:routes], only: [:show, :new, :edit]
  
  def index
    add_breadcrumb t('.title')
    
    @routes = Route.all
  end

  def show
    add_breadcrumb  t('.title') + " #{@route.name}", [:admin, :route]
  end

  def new
    add_breadcrumb t('.title'), [:new_admin, :route]

    @route = Route.new
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to [:admin, @route], :notice => get_text_notice
    else
      render :new
    end
  end

  def edit
    add_breadcrumb t('.title') + ": #{@route.name}", [:edit_admin, :route]  
  end

  def update    
    if @route.update(route_params)
      redirect_to [:admin, @route], :notice => get_text_notice
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to admin_routes_path, :notice => get_text_notice
  end

  private

  def route_params
    params.require(:route).permit(:name, railway_station_ids: [])
  end

  def get_text_notice
    t('.notice', action: @route.name.to_s)
  end

  def set_route
    @route = Route.find(params[:id])
  end
end

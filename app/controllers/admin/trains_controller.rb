class Admin::TrainsController < Admin::BaseController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  add_breadcrumb I18n.t('admin.control_panel.index.title'), [:admin,:control_panels_index]
  add_breadcrumb I18n.t('admin.trains.index.title'), [:admin,:trains], only: [:new, :show, :edit]

  def index
    add_breadcrumb t('.title')

    @trains = Train.all
  end

  def show
    add_breadcrumb t('.title') + " #{@train.number}", [:admin, :train]
  end

  def new
    add_breadcrumb t('.title'), [:new_admin, :train]

    @train = Train.new
  end

  def edit
    add_breadcrumb t('.title') + " #{@train.number}", [:edit_admin, :train]
  end

  def create
    @train = Train.new(train_params)

    if @train.save 
      redirect_to [:admin, @train], :notice => get_text_notice
    else
      render :new
    end
  end

  def update
    if @train.update(train_params)
      redirect_to [:admin, @train], :notice => get_text_notice
    else
      render :edit
    end
  end

  def destroy
    @train.destroy
    redirect_to admin_trains_path, :notice => get_text_notice
  end

  private
    def set_train
      @train = Train.find(params[:id])
    end

    def get_text_notice
      t('.notice', action: @train.number.to_s)
    end

    def train_params
      params.require(:train).permit(:number, :current_station_id, :route_id)
    end
end

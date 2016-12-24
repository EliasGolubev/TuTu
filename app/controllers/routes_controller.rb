class RoutesController < ApplicationController
  
  #
  # Получает все объекты класса Route
  #
  def index
    @routes = Route.all
  end
  #
  # Загружает конкретный объект
  #
  def show
    @route = Route.find(params[:id])
  end
  #
  # Создает новый объект Route
  #
  def new
    @route = Route.new
  end

  #
  # Создает новый объект Route
  #
  def create
    @route = Route.new(route_params)
    
    # Проверка валидации
    if @route.save
      redirect_to @route
    else
      render :new
    end

  end

  private
  #
  # Strong params 
  #
  def route_params
    params.require(:route).permit(:name)
  end

end
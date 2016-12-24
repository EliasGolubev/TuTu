class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]
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
  #
  # Загружает объект Route
  # Рендерит этот объект
  #
  def edit  
  end
  #
  # Загружает из базы объект
  # И обновляет объект в базе данных если прошла валидация.
  #
  def update    
    # Проверка валидации
    if @route.update(route_params)
      redirect_to @route
    else
      render :edit
    end
  end
  #
  # Удаляет объект из базы данных
  #
  def destroy
    @route.destroy
    redirect_to routes_path
  end

  private
  #
  # Strong params 
  #
  def route_params
    params.require(:route).permit(:name)
  end

  def set_route
    @route = Route.find(params[:id])
  end
end

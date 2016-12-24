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
end
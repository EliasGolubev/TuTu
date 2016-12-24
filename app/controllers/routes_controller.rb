class RoutesController < ApplicationController
  
  #
  # Получает все объекты класса Route
  #
  def index
    @routes = Route.all
  end
end
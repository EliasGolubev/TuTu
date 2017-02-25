class TicketsController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :set_ticket, only: [:destroy, :show]

  add_breadcrumb 'Поиск', [:root], only: [:show, :index]

  def new
    @ticket = Ticket.new
  end

  def create    
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def show
  end

  def index
    @tickets = current_user.tickets.all
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:fullname, :passport_number, :train_id, :first_station_id, :last_station_id)
  end
end
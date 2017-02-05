class Admin::TicketsController < ApplicationController
  before_action :set_ticket, only: [:destroy, :show, :edit, :update]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket]
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:fullname, :passport_number, :train_id, :first_station_id, :last_station_id)
  end
end
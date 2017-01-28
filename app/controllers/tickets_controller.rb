class TicketsController < ApplicationController
  
  def new
    @ticket = Ticket.new
    # render html: params.each { | x | x }
  end

  def create
    @ticket = Ticket.new(ticket_params)
   
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  private

  def ticket_params
    params.require(:ticket).permit(:user_id, :fullname, :passport_number, :train_id, :first_station_id, :last_station_id)
  end
end
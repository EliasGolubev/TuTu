class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:destroy, :show, :edit, :update]
  
  add_breadcrumb I18n.t('admin.control_panel.index.title'), [:admin,:control_panels_index]
  add_breadcrumb I18n.t('admin.tickets.index.title'), [:admin,:tickets], only: [:show, :edit]

  def index
    add_breadcrumb t('.title')

    @tickets = Ticket.all
  end

  def show
    add_breadcrumb t('.title')
  end

  def edit
    add_breadcrumb t('.title')
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket], :notice => t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path, :notice => t('.notice')
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:fullname, :passport_number, :train_id, :first_station_id, :last_station_id)
  end
end
class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:show, :destroy, :update, :edit]

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new(train_id: params[:train_id], start_station_id: params[:start_station_id], end_station_id: params[:end_station_id], user_id: params[:user_id])
  end

  def show
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      TicketsMailer.buy_ticket(currnet_user, @ticket).deliver_now
      redirect_to @ticket
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to admin_ticket_path(@ticket)
    else
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:train_id, :start_station_id, :end_station_id, :passenger_name, :passenger_number, :user_id)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end

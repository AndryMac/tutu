class TicketsController < ApplicationController
   before_action :authenticate_user!
   before_action :set_ticket, only: [:show, :destroy]


   def index
     @tickets = current_user.tickets
   end

   def new
     @ticket = Ticket.new(train_id: params[:train_id], start_station_id: params[:start_station_id], end_station_id: params[:end_station_id])
   end

   def show
   end

   def create
     @ticket = current_user.tickets.new(ticket_params)

       if @ticket.save
          redirect_to @ticket
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
     params.require(:ticket).permit(:train_id, :start_station_id, :end_station_id, :passenger_name, :passenger_number)
   end

   def set_ticket
     @ticket = current_user.tickets.find(params[:id])
   end
end
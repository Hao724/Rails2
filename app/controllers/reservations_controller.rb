class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end
  
  
  def new
    @reservation = Reservation.new
  end
  
  def create
        @reservation = Reservation.new(params.permit(:start_day, :end_day, :ninzuu, :user_id, :room_id))
        @reservation.user = current_user
        if @reservation.save
          flash[:yoyaku] = "予約を確定しました"
          redirect_to "/rooms/index"
        else
          @user = User.find_by(params[:user_id])
          redirect_to "/rooms/#{@user.id}"
        end
  end


end
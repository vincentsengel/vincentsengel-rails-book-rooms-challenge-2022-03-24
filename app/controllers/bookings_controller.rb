class BookingsController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
    @booking = Booking.new
  end

  def create
    range = booking_params[:starts_at].split(' to ')
    @user = current_user
    @booking = Booking.new(starts_at: range[0], ends_at: range[1])
    @room = Room.find(params[:room_id])
    @booking.room = @room
    @booking.user_id = @user.id
    if @booking.valid?
      @booking.save
      redirect_to room_path(@room)
      flash.alert = "Your room has been booked"
    else
      render "rooms/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at)
  end
end

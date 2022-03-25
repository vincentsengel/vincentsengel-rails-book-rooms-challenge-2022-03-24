class BookingsController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
    @booking = Booking.new
  end

  def create
    @user = current_user
    @booking = Booking.new(booking_params)
    @room = Room.find(params[:room_id])
    @booking.room = @room
    @booking.user_id = @user.id
    if @booking.valid?
      @booking.save
      redirect_to room_path(@room)
    else
      render "rooms/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
  end
end

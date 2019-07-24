class BookingsController < ApplicationController

    def new
        if !logged_in?
            redirect_to login_path
        end
        if params[:cruise_id] && @cruise = Cruise.find_by_id(params[:cruise_id])
            @booking = @cruise.bookings.build
            @booking.user = current_user
        else
            @booking = Booking.new
        end
    end
end

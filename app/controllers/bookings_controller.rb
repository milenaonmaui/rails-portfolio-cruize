class BookingsController < ApplicationController
    before_action :require_logged_in

    def new  
        if params[:cruise_id] && @cruise = Cruise.find_by_id(params[:cruise_id])
            @booking = @cruise.bookings.build
            @booking.user = current_user
        else
            @booking = Booking.new
        end
    end

    def create
        @booking = Booking.new(booking_params)
        @booking.user_id = current_user.id
        if @booking.save
           flash[:success] = "Booking created!"
           redirect_to booking_path(@booking)
        else
           flash[:error] = "#{@booking.errors.messages.values.join(". ")}"
           render :new
        end    
    end

    def show
        @booking = Booking.find_by_id(params[:id])
    end

    def edit
        @booking = Booking.find_by_id(params[:id])
    end

    def update
        @booking = Booking.find_by_id(params[:id])
        @booking.update(booking_params)
        redirect_to booking_path(@booking.cruise, @booking)
    end

    private

		def booking_params
			params.require(:booking).permit(:num_adults, :num_children, :user_id, :cruise_id)
		end
end

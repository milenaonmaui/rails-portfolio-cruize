class BookingsController < ApplicationController
    before_action :require_logged_in

    def new  
        if params[:cruise_id] && @cruise = Cruise.find_by_id(params[:cruise_id])
            @booking = @cruise.bookings.build
            @booking.user = current_user
        else
            flash[:error] = "Select a valid cruise"
            redirect_to cruises_path
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
        find_booking
    end

    def index
        redirect_to user_path(current_user)
    end

    def edit
        find_booking
    end

    def update
        find_booking
        @booking.update(booking_params)
        redirect_to booking_path(@booking.cruise, @booking)
    end

    def destroy
        find_booking
        @booking.destroy
        redirect_to user_path(current_user)
    end

    private

		def booking_params
			params.require(:booking).permit(:num_adults, :num_children, :user_id, :cruise_id)
        end
        
        def find_booking
            @booking = Booking.find_by_id(params[:id])
            if !@booking
                flash[:error] = "Invalid booking!"
                redirect_to user_path(current_user)
            end
        end
end

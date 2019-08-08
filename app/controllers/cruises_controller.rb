class CruisesController < ApplicationController

    def index
        
        if params[:categories]
          @cruises = Cruise.by_category(params[:categories])
        else
          @cruises = Cruise.all 
        end
    
    end

    def new
        @cruise = Cruise.new
    end

    def create
        binding.pry
        @cruise = Cruise.new(cruise_params)
        if @cruise.save
            redirect_to cruise_path(@cruise)
        else
            render :new
        end
    end

    def show
        @cruise = Cruise.find_by(:id => params[:id])
    end
   
    
    def edit
        find_cruise
    end

    def update
        find_cruise
        if @cruise.update(cruise_params)
            flash[:success] = "Cruise updated!"
            redirect_to cruise_path(@cruise)
         else
            flash[:error] = "Error updating cruise"
            render :edit
         end
    end

    def destroy
        find_cruise

        if @cruise.bookings.any?
            flash[:error] = "Cannot delete cruise with existing bookings."
            redirect_to cruise_bookings_path(@cruise)
        else
            @cruise.destroy
            redirect_to cruises_path
        end
    end

    private

        def cruise_params
            params.require(:cruise).permit(:name, :seats_left, :price_child, :price_adult, :min_age, :category_id, category_attributes:[:name])
        end

        def find_cruise
            @cruise = Cruise.find_by_id(params[:id])
            if !@cruise
                flash[:error] = "Invalid cruise!"
                redirect_to user_path(current_user)
            end
        end
end

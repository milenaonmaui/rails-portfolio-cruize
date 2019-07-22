class CruisesController < ApplicationController

    def index
        @cruises = Cruise.all
    end

    def show
        @cruise = Cruise.find_by(:id => params[:id])
    end
    
end

class CruisesController < ApplicationController

    def index
        
        if params[:categories]
          @cruises = Cruise.by_category(params[:categories])
        else
          @cruises = Cruise.all 
        end
    
    end

    def show
        @cruise = Cruise.find_by(:id => params[:id])
    end
    
end

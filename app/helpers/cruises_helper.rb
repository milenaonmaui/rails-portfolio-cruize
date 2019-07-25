module CruisesHelper

    def cruise_select(cruise, booking)
        if cruise
            hidden_field_tag "booking[cruise_id]", cruise.id
        else
          select_tag "booking[cruise_id]", options_from_collection_for_select(Cruise.all, :id, :name)
        end
    end
end

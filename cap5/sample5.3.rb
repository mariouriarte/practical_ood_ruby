class Trip
    attr_reader :bicycles, :customers, :vehicle

    def prepare(prepares)
        prepares.each {|preparer|preparer.prepare_trip(self)}
    end
end

class TripCoordinator
    def prepare_trip(trip)
        buy_food(trip.customers)
    end
end

class Driver
    def prepare_trip(trip)
        vehicle = trip.vehicle
        gas_up(vehicle)
        fill_water_tank(vehicle)
    end
end
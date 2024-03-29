class Bicycle
    attr_reader :size, :chain, :tire_size

    def initialize(**opts)
        @size = opts[:size]
        @chain = opts[:chain] || default_chain
        @tire_size = opts[:tire_size] || default_tire_size
    end

    def default_chain
        "11-speed"
    end
end

class RoadBike < Bicycle
    attr_reader :tape_color

    def initialize(**opts)
        @tape_color = opts[:tape_color]
        super
    end

    def default_tire_size
        "23"
    end

    def spares
        { chain: '11-speed',
        tire_size: '23',
        tape_color: tape_color }
    end
    
end

class MountainBike < Bicycle
    attr_reader :front_shock, :rear_shock

    def initialize(**opts)
        @front_shock = opts[:front_shock]
        @rear_shock = opts[:rear_shock]
        super
    end

    def default_tire_size
        "2.1"
    end

    def spares
        super.merge(front_shock: front_shock)
    end    
end

road_bike = RoadBike.new(
    size: 'M',    
    tape_color: 'red'
)

puts road_bike.tire_size
puts road_bike.chain


mountain_bike = MountainBike.new(
    size: 'S',
    front_shock: 'Manitou',
    rear_shock: 'Fox'
)

puts road_bike.tire_size
puts mountain_bike.chain



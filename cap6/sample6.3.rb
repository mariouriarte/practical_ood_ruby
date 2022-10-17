class Bicycle
    attr_reader :size, :tape_color

    def initialize(**opts)
        @size = opts[:size]
        @tape_color = opts[:tape_color]
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
    end

    def spares
        super.merge(front_shock: front_shock)
    end    
end

mountainBike = MountainBike.new(
    size: 'S',
    front_shock: 'Manitou',
    rear_shock: 'Fox'
)

puts mountainBike.size
puts mountainBike.spares
class Gear

    attr_reader :chainring, :cog, :wheel

    def initialize(chainring: default_chairing, cog: 80, wheel: nil)
        @chainring = chainring
        @cog = cog
        @wheel = wheel
    end

    def ratio
        chainring / cog.to_f
    end

    def gear_inches
        ratio * diameter   
    end

    def diameter
        wheel.diameter
    end

    def default_chairing
        (100/2) - 10
    end
end

class Wheel
    attr_reader :rim, :tire
    def initialize(rim:, tire:)
        @rim = rim
        @tire = tire        
    end

    def diameter
        rim + (tire * 2)
    end

    def circumference
        diameter * Math::PI        
    end
end

@wheel = Wheel.new(rim: 26, tire: 1.5)
puts @wheel.circumference

puts Gear.new(wheel: @wheel).gear_inches

puts Gear.new(chainring:52, cog:11).ratio

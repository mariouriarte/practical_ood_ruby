module SomeFramework
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
end

module GearWrapper
    def self.gear(chainring:, cog:, wheel:)
        SomeFramework::Gear.new(chainring: chainring, cog: cog, wheel: wheel)
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

puts GearWrapper.gear(
    chainring: 52,
    cog: 11,
    wheel:  Wheel.new(rim:26, tire:1.5)).gear_inches

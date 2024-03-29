class Schedule
    def scheduled?(schedulable, starting, ending)
        puts "This #{schedulable.class} is " + "available #{starting} - #{ending}"
        false
    end
end

module Schedulable

    attr_writer :schedule

    def schedule
        @schedule ||= Schedule.new
    end

    def schedulable?(starting, ending) 
        !scheduled?(starting - lead_days, ending)
    end

    def scheduled?(starting, ending)
        schedule.scheduled?(self, starting, ending)
    end

    def lead_days
        0
    end
end


class Vehicle
    include Schedulable

    def lead_days
        3
    end
end

class Mechanic
    include Schedulable

    def lead_days
        4
    end
end

require 'date'

starting = Date.parse("2019/09/04")
ending = Date.parse("2019/09/10")

v = Vehicle.new
puts v.schedulable?(starting, ending)

m = Mechanic.new
puts m.schedulable?(starting, ending)

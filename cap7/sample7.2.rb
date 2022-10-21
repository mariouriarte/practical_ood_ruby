class Schedule
    def scheduled?(schedulable, starting, ending)
        puts "This #{schedulable.class} is " + "available #{starting} - #{ending}"

        false
    end
end

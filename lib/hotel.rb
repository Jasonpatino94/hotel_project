require 'byebug'
require_relative "room"

# require 'byebug'

class Hotel

    def initialize(name, capacity)
        @name = name
        @rooms = {}

        capacity.each do |name , size|
            @rooms[name] = Room.new(size)
        end
    end

    def name
        @name.split(' ').map{|name| name = name.capitalize}.join(' ')
    end

    def rooms
        @rooms
    end

    def room_exists?(name)
        if !@rooms[name]
            false
        else
            true
        end
    end

    def check_in(person, room)
        if self.room_exists?(room)
            if @rooms[room].add_occupant(person)
                puts "check in successful"
            else
                print 'sorry, room is full'
            end
        else
            print 'sorry, room does not exist'
        end
    end

    def has_vacancy?
        @rooms.values.any? {|size| size.available_space > 0}
    end

    def list_rooms
        @rooms.each do |name, room|
            puts "#{name} : #{room.available_space}"
        end
    end
  
end

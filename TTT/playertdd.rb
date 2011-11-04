# playertdd.rb
# Player TDD Class
#
# Author: Jakub Misterka
#*************************


class Playertdd

    attr_accessor :marker

    def initialize(p = :x)
        @marker = p
    end
    
    def getMove
        print "Enter your move human: "
        move = $stdin.gets.chomp.to_i
        return move
    end

    def announce
        puts "Human's Turn!\n"
    end
    
end

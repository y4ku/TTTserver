#BoardTDD.rb
#Tic Tac Toe TDD
#
#Author: Jakub Misterka
#************************

class Boardtdd

    attr_accessor :b 

    def initialize
        @b = Array.new(9) { '-' }
    end 

    def boardPrint
      string = ""
        count = 0
        for i in 1..9
            string += "[ #{i-1} ]"
            if i % 3 == 0 then
                string += "   "
                0.upto(2) do
                    string += "[ #{@b[count]} ]"
                    count += 1
                end
            string += "\n" 
            end
        end
      return string
    end

    def isFull?
        for i in 0..8
            if @b[i] == "-"
                return false;
            end
        end
        return true;
    end        
    
    def placeMove(move, player)
        @b[move] = player
    end

end
            

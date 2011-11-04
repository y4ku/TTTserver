#rulestdd.rb


class Rulestdd
	
	attr_accessor :board
	
    def initialize(board)
        @board = board
    end

    def whoWon
        for i in 0..2
            check = i*3
            player = @board.b[check] != "-" ? @board.b[check] : false
            if(player == @board.b[check+1] && player == @board.b[check+2]) then
                return player
            end
            player = @board.b[i] != "-" ? @board.b[i] : false
            if(player == @board.b[i+3] && player == @board.b[i+6]) then
                return player
            end
        end
        player = @board.b[0] != "-" ? @board.b[0] : false
        if(player == @board.b[4] &&  player == @board.b[8]) then
            return player
        end
        player = @board.b[2] != "-" ? @board.b[2] : false
        if(player == @board.b[4] && player == @board.b[6]) then
            return player
        end
        return nil
    end

    def isFull?
        for i in 0..8
            if @board.b[i] == "-"
                return false;
            end
        end
        return true;
    end

    def isValidMove?(move)
        if move >= 0 && move < 9 && @board.b[move] == "-"
            return true
        else return false        
        end
    end


end

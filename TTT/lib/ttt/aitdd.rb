#aitdd.rb
class Aitdd < Playertdd

    attr_accessor :rules
    
def initialize(rules, p = :o)
    @marker = p
    @rules = rules
end

def nextMoveWin(player = @marker)
    for i in 0..2
        check = i*3
        if(checkFTW(check + 1, check + 2)) then               
            if checkValid(check) != false then return @bmove end
        end
        if(checkFTW(check, check + 2)) then  
            if checkValid(check+1) != false then return @bmove end
        end
        if(checkFTW(check, check + 1)) then  
            if checkValid(check+2) != false then return @bmove end
        end
        if(checkFTW(i + 3, i + 6)) then  
            if checkValid(i) != false  then return @bmove end
        end
        if(checkFTW(i, i + 6)) then  
            if checkValid(i+3) != false  then return @bmove end
        end
        if(checkFTW(i, i + 3)) then  
            if checkValid(i+6) != false  then return @bmove end
        end
    end
    
    if(checkFTW(4, 8)) then  
        if checkValid(0) != false  then return @bmove end
    end
    if(checkFTW(0, 8)) then  
        if checkValid(4) != false  then return @bmove end
    end
    if(checkFTW(0, 4)) then  
        if checkValid(8) != false  then return @bmove end
    end
    if(checkFTW(4, 6)) then  
        if checkValid(2) != false  then return @bmove end
    end
    if(checkFTW(2, 6)) then  
        if checkValid(4) != false  then return @bmove end
    end
    if(checkFTW(2, 4)) then  
       if checkValid(6) != false  then return @bmove end
    end
    return nil
end
    
    def negamax(p = @marker, depth = 0)
		
			if @rules.whoWon == p then 
				return 1
			elsif @rules.whoWon == (p == :o ? :x : :o) 
				return -1
			elsif @rules.isFull?
				return 0
			end
			
		best = -10000
		bestmove = -10000
		
		for i in 0..8
			if @rules.isValidMove?(i) then
				@rules.board.placeMove(i, p)
				value = -negamax(p == :o ? :x : :o , depth + 1)
				@rules.board.placeMove(i, '-')
				if value > best then
					best = value
					@bmove = i if depth == 0
				end
			end
		end		
		return best	
	end

    def checkFTW(first, second)
      player = @marker
        if player == @rules.board.b[first] && player == @rules.board.b[second] then
            return true
        else
            return false
        end
    end    

    def checkValid(move)
        if @rules.isValidMove?(move) then 
            return @bmove = move
        else
            return false
        end         
    end

	def getMove
        if nextMoveWin != nil
            return @bmove
        end
		negamax
		return @bmove
	end
    
    def announce
        puts "CPU Turn!\n"
    end

end

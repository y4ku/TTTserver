load 'boardtdd.rb'
load 'rulestdd.rb'
load 'playertdd.rb'
load 'aitdd.rb'

class Gametdd

    attr_reader :player, :ai
    attr_accessor :turn, :rules

    def initialize
        @rules = Rulestdd.new(Boardtdd.new)
        @player = Playertdd.new
        @ai = Aitdd.new(@rules)
        @turn = @player
    end

    def start
        puts "Welcome to Tic Tac Toe"

        if askyesno("to go first") == "n"
            @turn = @ai
        end

        @rules.board.boardPrint

        while !@rules.isFull?

            @turn.announce

            while !@rules.isValidMove?(move = @turn.getMove)
            end

            @rules.board.placeMove(move, @turn.marker)

            @rules.board.boardPrint

            if(@turn.marker == @rules.whoWon)
                win
                reset
            end
            
            switchPlayer            
        end

        draw
        reset

    end

    def askyesno(question)
        
        while(1)
            print "Would you like you #{question}? (y/n) : "

            answer = $stdin.gets.chomp

            if answer == "y"
                return "y"
            elsif answer == "n"
                return "n"
            end
        end
    end

    def switchPlayer
        @turn = @turn == @player ? @ai : @player
    end

    def win
        if(@turn == @player)
            puts "Congratulations Human, You Won."
        else
            puts "CPU Won, You Lose."
        end       
    end

    def reset

        if askyesno("play again") == "y" then 
            game_reset          
            start
        else 
            puts "GoodBye!"
            exit 
        end
    end

    def draw
        puts "Game is a Draw!"
        @rules.board.boardPrint
    end
    
    def game_reset
        initialize
    end

end 

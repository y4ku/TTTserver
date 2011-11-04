require 'java'
java_import "java.util.HashMap"
require './jkserve.jar'
require 'rubygems'
require 'ttt'
s
import 'ResponseType'
import 'HTTPServer'
import 'HTTPResponse'

class GetTTT
    include ResponseType
    java_hash = HashMap.new();

    attr_reader :player, :ai
    attr_accessor :turn, :rules

    def initialize
        @rules = Rulestdd.new(Boardtdd.new)
        @player = Playertdd.new
        @ai = Aitdd.new(@rules)
        @turn = @player
    end

    def serveResponse(java_hash)
      if(!java_hash.containsKey("param0"))
        return printBoardSubmit("Welcome to Tic Tac Toe!")
      elsif(java_hash.containsKey("param0"))
          @rules.board.placeMove(java_hash.get("param0").to_i, @player.marker)
          if(@player.marker == @rules.whoWon)
            return printBoardString("You Won!")
          elsif(@rules.isFull?)
            return printBoardString("Draw!")
          end
          @rules.board.placeMove(@ai.getMove, @ai.marker)

          if(@ai.marker == @rules.whoWon)
            return printBoardString("Your Lose!")
          elsif(@rules.isFull?)
            return printBoardString("Draw!")
          end
          return printBoardSubmit
      end
    end

    def submitMove
      return '<form action="/game" method="get">
                Your Move: <input type="text" name="move" /><br />
                <input type="submit" value="Submit" />
              </form>'
    end

    def printBoardString(string)
      return "#{HTTPResponse.new.getHeader(200)}<html><body<h1>#{string}\n</h1></body></html>".bytes.to_a
    end

    def printBoardSubmit(string = "")
      return "#{HTTPResponse.new.getHeader(200)}<html><body><h1>#{string}</h1><pre>#{@rules.board.boardPrint}</pre>#{submitMove}</body></html>".bytes.to_a
    end
end


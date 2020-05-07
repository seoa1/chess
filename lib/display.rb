require_relative 'board.rb'
require 'colorize'
require_relative 'cursor.rb'

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        puts "  ABCDEFGH"
        (0..7).each do |row|
            print (row + 1).to_s + " "
            (0..7).each do |col|
                piece = @board[[row, col]]
                if piece.color == :W
                    print piece.symbol.to_s.colorize(:white) 
                elsif piece.color == :B
                    print piece.symbol.to_s.colorize(:black)
                else
                    print piece.symbol.to_s.colorize(:green)
                end
            end
            puts
        end
    end
end
board = Board.new
display = Display.new(board)
display.render
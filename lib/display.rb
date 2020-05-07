require_relative 'board.rb'
require 'colorize'
require_relative 'cursor.rb'

class Display
    def initialize
        @board = Board.new
        @cursor = Cursor.new([0,0], @board)
    end

    def render
        system("clear")
        loop do
            puts "  ABCDEFGH"
            (0..7).each do |row|
                print (row + 1).to_s + " "
                (0..7).each do |col|
                    bg = cursor_update(row, col)
                    piece = @board[[row, col]]
                    if piece.color == :W
                        print piece.symbol.to_s.colorize(color: :white, background: bg)
                    elsif piece.color == :B
                        print piece.symbol.to_s.colorize(color: :black, background: bg)
                    else
                        print piece.symbol.to_s.colorize(color: :black, background: bg)
                    end
                end
                puts
            end
            @cursor.get_input
            system("clear")
        end
    end

    def cursor_update(row, col)
        if @cursor.cursor_pos == [row, col]
            if @cursor.selected
                :light_green
            else
                :light_red
            end
        elsif (row + col).odd?
            :light_blue
        else
            :blue
        end
    end
end
display = Display.new
display.render
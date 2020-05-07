require_relative 'board.rb'
require 'colorize'
require_relative 'cursor.rb'

class Display
    def initialize
        @board = Board.new
        @cursor = Cursor.new([0,0], @board)
    end

    def render
        start_pos = []
        end_pos = []
        system("clear")
        loop do
            puts "  ABCDEFGH"
            (0..7).each do |row|
                print (8 - row).to_s + " "
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
            pos = @cursor.get_input
            error = false
            if pos
                if @cursor.selected
                    start_pos = pos
                else
                    end_pos = pos
                    begin
                        @board.move_piece(@board[start_pos].color, start_pos, end_pos)
                    rescue ArgumentError
                        error = true
                    end
                end
            end
            system("clear")
            puts "Not a valid move" if error
        end
    end

    def cursor_move

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
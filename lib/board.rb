require_relative "piece.rb"

class Board
    def initialize
        @grid = Array.new(8) { Array.new(8) }
        [0,1,6,7].each do |row|
            (0..7).each do |column|
                @grid[row][column] = Piece.new([row, column])
            end
        end
    end

    def move_piece(start_pos, end_pos)
        raise ArgumentError.new "No piece at starting position" if self[start_pos].nil?
        raise ArgumentError.new "Piece cannot move there" if end_pos[0] < 0 or end_pos[0] > 7 or end_pos[1] < 0 or end_pos[1] > 7 or !self[end_pos].nil?
        self[start_pos].pos = end_pos
        self[end_pos], self[start_pos] = self[start_pos], nil
    end

    def [](pos)
        row, column = pos
        @grid[row][column]
    end

    def []=(pos, piece)
        row, column = pos
        @grid[row][column] = piece
    end
end
require_relative "knight.rb"
require_relative "king.rb"
require_relative "bishop.rb"
require_relative "queen.rb"
require_relative "nullpiece.rb"
require_relative "rook.rb"
require_relative "pawn.rb"

class Board
    def initialize
        @grid = Array.new(8) { Array.new(8) }
        (0..7).each do |row|
            (0..7).each do |col|
                self[[row, col]] = NullPiece.instance if (2..5).include?(row)
                self[[row, col]] = Pawn.new([row, col], self, :W) if row == 1
                self[[row, col]] = Pawn.new([row, col], self, :B) if row == 6
                self[[row, col]] = Rook.new([row, col], self, :W) if row == 0 && (col == 0 || col == 7)
                self[[row, col]] = Rook.new([row, col], self, :B) if row == 7 && (col == 0 || col == 7)
                self[[row, col]] = Bishop.new([row, col], self, :W) if row == 0 && (col == 2 || col == 5)
                self[[row, col]] = Bishop.new([row, col], self, :B) if row == 7 && (col == 2 || col == 5)
                self[[row, col]] = Knight.new([row, col], self, :W) if row == 0 && (col == 1 || col == 6)
                self[[row, col]] = Knight.new([row, col], self, :B) if row == 7 && (col == 1 || col == 6)
                self[[row, col]] = Queen.new([row, col], self, :W) if row == 0 && col == 3
                self[[row, col]] = Queen.new([row, col], self, :B) if row == 7 && col == 3
                self[[row, col]] = King.new([row, col], self, :W) if row == 0 && col == 4
                self[[row, col]] = King.new([row, col], self, :B) if row == 7 && col == 4

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
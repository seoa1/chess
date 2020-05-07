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
                self[[row, col]] = Pawn.new([row, col], self, :B) if row == 1
                self[[row, col]] = Pawn.new([row, col], self, :W) if row == 6
                self[[row, col]] = Rook.new([row, col], self, :B) if row == 0 && (col == 0 || col == 7)
                self[[row, col]] = Rook.new([row, col], self, :W) if row == 7 && (col == 0 || col == 7)
                self[[row, col]] = Bishop.new([row, col], self, :B) if row == 0 && (col == 2 || col == 5)
                self[[row, col]] = Bishop.new([row, col], self, :W) if row == 7 && (col == 2 || col == 5)
                self[[row, col]] = Knight.new([row, col], self, :B) if row == 0 && (col == 1 || col == 6)
                self[[row, col]] = Knight.new([row, col], self, :W) if row == 7 && (col == 1 || col == 6)
                self[[row, col]] = Queen.new([row, col], self, :B) if row == 0 && col == 3
                self[[row, col]] = Queen.new([row, col], self, :W) if row == 7 && col == 3
                self[[row, col]] = King.new([row, col], self, :B) if row == 0 && col == 4
                self[[row, col]] = King.new([row, col], self, :W) if row == 7 && col == 4
            end
        end
    end

    attr_writer :grid

    def move_piece(color, start_pos, end_pos)
        raise ArgumentError.new "No piece at starting position" if self[start_pos].is_a?(NullPiece)
        raise ArgumentError.new "Piece cannot move there" if !valid_pos?(end_pos) || self[end_pos].color == self[start_pos].color || !self[start_pos].valid_moves.include?(end_pos)
        self[start_pos].pos = end_pos
        self[end_pos], self[start_pos] = self[start_pos], NullPiece.instance
    end

    def [](pos)
        row, column = pos
        @grid[row][column]
    end

    def []=(pos, piece)
        row, column = pos
        @grid[row][column] = piece
    end

    def pieces
        pieces = []
        (0..7).each do |row|
            (0..7).each do |col|
                piece = self[[row, col]]
                pieces << piece unless piece.is_a?(NullPiece)
            end
        end
        pieces
    end

    def find_king(color)
        pieces.each { |piece| return piece if piece.color == color && piece.is_a?(King)}
    end

    def move_piece!(color, start_pos, end_pos)
        self[start_pos].pos = end_pos
        self[end_pos], self[start_pos] = self[start_pos], NullPiece.instance
    end

    def valid_pos?(pos)
        return false if pos[0] < 0 or pos[0] > 7 or pos[1] < 0 or pos[1] > 7
        true
    end

    def in_check?(color)
        opp_pieces = pieces.select {|piece| piece.color != color}
        king_pos = find_king(color).pos
        opp_pieces.any? {|piece| piece.moves.include?(king_pos)}
    end

    def checkmate?(color)
        same_pieces = pieces.select {|piece| piece.color == color}
        return true if in_check?(color) && same_pieces.any? {|piece| piece.valid_moves.length > 0}
        false
    end

    def dup
        board_copy = Board.new
        new_grid = Array.new(8) { Array.new(8) }
        (0..7).each do |row|
            (0..7).each do |col|
                piece = @grid[row][col]
                unless piece.is_a?(NullPiece)
                    new_piece = piece.dup
                    new_piece.board = board_copy
                    new_grid[row][col] = new_piece
                else
                    new_grid[row][col] = NullPiece.instance
                end
            end
        end
        board_copy.grid = new_grid
        board_copy
    end

end
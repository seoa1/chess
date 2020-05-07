
class Piece
    def initialize(start_pos, board, color)
        @pos = start_pos
        @board = board
        @color = color
    end
    attr_reader :color
    attr_accessor :pos
    attr_writer :board
    def valid_moves
        moves.select {|move| !move_into_check?(move)}
    end

    def move_into_check?(end_pos)
        duped_board = @board.dup
        duped_board.move_piece!(@color, @pos, end_pos)
        duped_board.in_check?(@color)
    end

    

end
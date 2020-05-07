require_relative 'piece.rb'

class Pawn < Piece
    def moves
        moves = []
        row = @pos[0]
        col = @pos[1]
        forward_one = row + forward_dir
        moves << [forward_one, col] if @board[forward_one, col].is_a?(NullPiece)
        moves << [forward_one + forward_dir, col] if @board[forward_one + forward_dir, col].is_a?(NullPiece) && at_start_row?
        if @color == :W
            moves << [forward_one, col + 1] if @board[forward_one, col + 1].color == :B
        else
            moves << [forward_one, col + 1] if @board[forward_one, col + 1].color == :W
        end
        moves
    end

    def forward_dir
        return 1 if @color == :W
        -1
    end

    def at_start_row?
        return true if (@color == :W && @pos[0] == 1) || (@color == :B && @pos[0] == 7)
        false
    end

    def symbol
        :P
    end
end
require_relative 'piece.rb'

class Pawn < Piece
    def moves
        moves = []
        row = @pos[0]
        col = @pos[1]
        forward_one = row + forward_dir
        moves << [forward_one, col] if @board[[forward_one, col]].is_a?(NullPiece)
        moves << [forward_one + forward_dir, col] if @board[[forward_one + forward_dir, col]].is_a?(NullPiece) && at_start_row?
        if @color == :W
            opp_color = :B
        else
            opp_color = :W
        end
        right_up = [forward_one, col + 1]
        left_up = [forward_one, col - 1]
        moves << right_up if @board.valid_pos?(right_up) && @board[right_up].color == opp_color
        moves << left_up if @board.valid_pos?(left_up) && @board[left_up].color == opp_color
        moves
    end

    def forward_dir
        return 1 if @color == :B
        -1
    end

    def at_start_row?
        return true if (@color == :B && @pos[0] == 1) || (@color == :W && @pos[0] == 6)
        false
    end

    def symbol
        :P
    end
end
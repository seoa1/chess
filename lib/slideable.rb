module Slideable
    def moves(type)
        d_moves = grow_moves([1, 1]) + grow_moves([1, -1]) + grow_moves([-1, -1]) + grow_moves([-1, 1])
        h_moves = grow_moves([1, 0]) + grow_moves([0, 1]) + grow_moves([-1, 0]) + grow_moves([0, -1])
        if type == "diagonal"
            return d_moves
        elsif type == "horizontal"
            return h_moves
        else
            return d_moves + h_moves
        end
    end

    def grow_moves(diff_arr)
        moves = []
        row, col = @pos[0].dup, @pos[1].dup
        i = 1
        row_add, col_add = diff_arr[0], diff_arr[1]
        loop do
            new_pos = [row + (row_add * i), col + (col_add * i)]
            moves << new_pos
            break unless new_pos.nil?
            i += 1
        end
        moves
    end
end
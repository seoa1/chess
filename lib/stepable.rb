module Stepable
    def moves(move_set)
        moves = []
        move_set.each do |move|
            row = move[0] + @pos[0]
            col = move[1] + @pos[1]
            new_pos = [row, col]
            moves << new_pos unless @board[new_pos].color == self.color || row < 0 || row > 7 || col < 0 || col > 7
        end
        moves
    end
end
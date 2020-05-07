require_relative "stepable.rb"
require_relative "piece.rb"

class King < Piece
    include Stepable
    def moves
        move_set = [[1,1],[0,1],[1,0],[-1,1],[-1,0],[-1,-1],[0,-1],[1,-1]
        super(move_set)
    end

    def symbol
        :W
    end
end
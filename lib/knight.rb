require_relative "stepable.rb"
require_relative "piece.rb"

class Knight < Piece
    include Stepable
    def moves
        move_set = [[1,2],[2,1],[-1,2],[-2,1],[-1,-2],[-2,-1],[1,-2],[2,-1]
        super(move_set)
    end

    def symbol
        :K
    end
end
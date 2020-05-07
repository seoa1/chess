require_relative "slideable.rb"
require_relative "piece.rb"

class Queen < Piece
    include Slideable
    def moves
        super("both")
    end

    def symbol
        :Q
    end
end
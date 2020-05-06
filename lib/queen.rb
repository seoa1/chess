require_relative "slideable.rb"
require_relative "piece.rb"

class Queen < Piece
    def moves
        super("both")
    end
end
require_relative "slideable.rb"
require_relative "piece.rb"

class Rook < Piece
    def moves
        super("horizontal")
    end
end
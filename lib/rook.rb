require_relative "slideable.rb"
require_relative "piece.rb"

class Rook < Piece
    include Slideable
    def moves
        super("horizontal")
    end

    def symbol
        :R
    end
end
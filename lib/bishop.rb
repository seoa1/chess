require_relative 'piece.rb'
require_relative 'slideable.rb'

class Bishop < Piece
    include Slideable
    def moves
        super("diagonal")
    end
end
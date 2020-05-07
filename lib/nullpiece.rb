require 'piece.rb'
class NullPiece < Piece
    include Singleton
    def initialize
        @color = :G
        @symbol = :N
    end

    attr_reader :color, :symbol
end
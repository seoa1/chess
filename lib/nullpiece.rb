require 'piece.rb'
class NullPiece < Piece
    include Singleton
    def initialize
        @color = :G
    end

    attr_reader :color

    def symbol
        :_
    end
end
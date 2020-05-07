require_relative 'piece.rb'
require 'singleton'

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
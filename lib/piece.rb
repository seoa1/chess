require_relative "board.rb"

class Piece
    def initialize(start_pos = nil, board, color)
        @pos = start_pos
        @board = board
        @color = color
    end
    attr_reader :color
    attr_accessor :pos


end
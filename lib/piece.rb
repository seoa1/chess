require_relative "board.rb"

class Piece
    def initialize(start_pos = nil, board)
        @pos = start_pos
        @board = board
    end

    attr_accessor :pos


end
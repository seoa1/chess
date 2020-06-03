class Game
    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @players = {Player_One: :W, Player_Two: :B}
    end

    def play
    end
end
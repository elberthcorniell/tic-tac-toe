class Player 
    attr_reader :name
    attr_reader :symbol

    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end
end

class TicTacToe
    attr_reader :turn
    attr_reader :board
    attr_writer :turn

    def initialize(symbol, player1, player2)
        @@player1 = Player.new(player1, symbol)
        @@player2 = Player.new(player2, symbol == "X" ? "O" : "X")
        @board = [" "," "," "," "," "," "," "," "," "]
        @turn = true
    end

    def is_valid?(movement = -1)
        movement > 0 && movement < 10 && board[movement - 1] == " "
    end

    def make_movement(movement)
        if is_valid?(movement)
            board[movement - 1] = turn ? @@player1.symbol : @@player2.symbol
            @turn = !turn
            return true
        end
        false
    end

    def is_draw?
        availablePositions = board.any? " "
        if availablePositions
            return false
        end
        true
    end

    def did_win?
        symbol = !turn ? @@player1.symbol : @@player2.symbol
        # Check rows
        for i in 0..2 do
            if board[0 + (3 * i)] == symbol && board[1 + (3 * i)] == symbol && board[2 + (3 * i)] == symbol
                return true
            end
        end
        
        # Check columns
        for i in 0..2 do
            if board[0 + i] == symbol && board[3 + i] == symbol && board[6 + i] == symbol
                return true
            end
        end

        # check diagonals
        if board[0] == symbol && board[4] == symbol && board[8] == symbol
            return true
        end

        if board[2] == symbol && board[4] == symbol && board[6] == symbol
            return true
        end

        false
    end

    def get_player_name(oposite = nil)
        if oposite
            !turn ? @@player1.name : @@player2.name
        else
            turn ? @@player1.name : @@player2.name
        end
    end

end
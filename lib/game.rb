class TicTacToe
    attr_reader :turn
    attr_writer :turn

    def initialize(symbol)
        @@player1 = symbol
        @@player2 = symbol == "X" ? "O" : "X"
        @@board = [" "," "," "," "," "," "," "," "," "]
        @turn = true
    end

    def putBoard
        arr = @@board
        puts "\nBoard:          Positions:\n\n"
        puts "  #{arr[6]}  |  #{arr[7]}  |  #{arr[8]}     7     8     9"
        puts "_____|_____|_____"
        puts "  #{arr[3]}  |  #{arr[4]}  |  #{arr[5]}     4     5     6"
        puts "_____|_____|_____"
        puts "  #{arr[0]}  |  #{arr[1]}  |  #{arr[2]}     1     2     3"
        puts "     |     |     "
    end

    def isValid(movement = -1)
        movement > 0 && movement < 10 && @@board[movement - 1] == " "
    end

    def makeMovement(movement)
        if isValid(movement)
            @@board[movement - 1] = @turn ? @@player1 : @@player2 
            @turn = !@turn
            return true
        end
        false
    end

    def isDraw
        availablePositions = @@board.any? " "
        if availablePositions
            return false
        end
        true
    end

    def didWin
        symbol = !@turn ? @@player1 : @@player2
        # Check rows
        puts symbol
        for i in 0..2 do
            if @@board[0 + (3 * i)] == symbol && @@board[1 + (3 * i)] == symbol && @@board[2 + (3 * i)] == symbol
                return true
            end
        end
        
        # Check columns
        for i in 0..2 do
            if @@board[0 + i] == symbol && @@board[3 + i] == symbol && @@board[6 + i] == symbol
                return true
            end
        end

        # check diagonals
        if @@board[0] == symbol && @@board[4] == symbol && @@board[8] == symbol
            return true
        end

        if @@board[2] == symbol && @@board[4] == symbol && @@board[6] == symbol
            return true
        end

        false
    end

end
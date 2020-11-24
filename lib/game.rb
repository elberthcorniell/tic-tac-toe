class TicTacToe
    attr_reader :turn

    def initialize(symbol)
        @@player1 = symbol
        @@player2 = symbol == "X" ? "O" : "X"
        @@board = [" "," "," "," "," "," "," "," "," ",]
        @@turn = true
    end

    def putBoard
        arr = @@board
        puts "\nBoard:          Positions:\n\n"
        puts "  #{arr[0]}  |  #{arr[1]}  |  #{arr[2]}     1     2     3"
        puts "_____|_____|_____"
        puts "  #{arr[3]}  |  #{arr[4]}  |  #{arr[5]}     4     5     6"
        puts "_____|_____|_____"
        puts "  #{arr[6]}  |  #{arr[7]}  |  #{arr[8]}     7     8     9"
        puts "     |     |     "
    end

    def isValid(movement = -1)
        movement > 0 && movement < 10 && board[movement] == " "
    end

    def makeMovement(movement)
        if isValid(movement)
            @@board[movement - 1] = @@turn ? @@player1 : @@player2 
            @@turn = !@@turn
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

end
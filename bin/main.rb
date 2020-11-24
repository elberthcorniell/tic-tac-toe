#!/usr/bin/env ruby
require './lib/game'

ticTacToe = nil
def clear
    system "clear" or system "cls"
end

def putBoard (arr)
    puts "\nBoard:          Positions:\n\n"
    puts "  #{arr[6]}  |  #{arr[7]}  |  #{arr[8]}     7     8     9"
    puts "_____|_____|_____"
    puts "  #{arr[3]}  |  #{arr[4]}  |  #{arr[5]}     4     5     6"
    puts "_____|_____|_____"
    puts "  #{arr[0]}  |  #{arr[1]}  |  #{arr[2]}     1     2     3"
    puts "     |     |     "
end

clear
puts "Welcome to Tic Tac Toe!"
puts "Do you want to start with \"X\" or \"O\"?"

while 1 do
    symbol = gets.chomp.upcase 
    if  symbol == "X" || symbol == "O"
        puts "Player 1 name:"
        player1 = gets.chomp
        puts "Player 2 name:"
        player2 = gets.chomp
        ticTacToe = TicTacToe.new(symbol, player1, player2)
        puts "Game started!"
        break
    else
        puts "Do you want to start with \"X\" or \"O\"?"
    end
end

clear

while 1 do
    putBoard ticTacToe.board
    puts "It's #{ticTacToe.get_player_name} turn"
    puts "Choose your next movement!"
    movement = gets.chomp.to_i
    clear
    if ticTacToe.is_valid? movement
        puts "Now, your move is displayed on the board!"
        ticTacToe.make_movement movement
    else
        puts "Invalid movement!!!!"
        next
    end
    if ticTacToe.did_win?
        clear
        putBoard ticTacToe.board
        puts "Player #{ticTacToe.get_player_name true} have won!"
        break
    end
    if ticTacToe.is_draw?
        clear    
        putBoard ticTacToe.board
        puts "We have a Draw!"
        break
    end
end

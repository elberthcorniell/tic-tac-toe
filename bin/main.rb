#!/usr/bin/env ruby
require './lib/game'

ticTacToe = nil
def clear
    system "clear" or system "cls"
end

clear
puts "Welcome to Tic Tac Toe!"
puts "Do you want to start with \"X\" or \"O\"?"

while 1 do
    symbol = gets.chomp.upcase 
    if  symbol == "X" || symbol == "O"
        ticTacToe = TicTacToe.new(symbol)
        puts "Game started!"
        break
    else
        puts "Do you want to start with \"X\" or \"O\"?"
    end
end

clear

while 1 do
    ticTacToe.putBoard
    puts "Player #{ticTacToe.turn ? 1 : 2} turn"
    puts "Choose your next movement!"
    movement = gets.chomp.to_i
    clear
    if ticTacToe.isValid movement # We need to check if the position is available too
        puts "Now, your move is displayed on the board!"
        ticTacToe.makeMovement movement
    else
        puts "Invalid movement!!!!"
        next
    end
    if ticTacToe.didWin # We are going to check here if someone has won
        clear
        ticTacToe.putBoard
        puts "Player #{ticTacToe.turn ? 1 : 2} have won!"
        break
    end
    if ticTacToe.isDraw # We are going to check here if theres a draw
        clear    
        ticTacToe.putBoard
        puts "We have a Draw!"
        break
    end
    player = !player
end

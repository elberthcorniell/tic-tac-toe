#!/usr/bin/env ruby

def putBoard(arr = [])
    puts "\nBoard:          Positions:\n\n"
    puts "  #{arr[0]}  |  #{arr[1]}  |  #{arr[2]}     1     2     3"
    puts "_____|_____|_____"
    puts "  #{arr[3]}  |  #{arr[4]}  |  #{arr[5]}     4     5     6"
    puts "_____|_____|_____"
    puts "  #{arr[6]}  |  #{arr[7]}  |  #{arr[8]}     7     8     9"
    puts "     |     |     "
end

def clear
    system "clear" or system "cls"
end

player = true
board = [" "," "," "," "," "," "," "," "," ",]
symbol = nil
draw = false
isValid = true

clear
puts "Welcome to Tic Tac Toe!"
puts "Do you want to start with \"X\" or \"O\"?"

while 1 do
    symbol = gets.chomp.upcase 
    if  symbol == "X" || symbol == "O"
        puts "Game started!"
        break
    else
        puts "Do you want to start with \"X\" or \"O\"?"
    end
end

clear

while 1 do
    putBoard board
    puts "Player #{player ? 1 : 2} turn"
    puts "Choose your next movement!"
    movement = gets.chomp.to_i
    clear
    if isValid # movement > 0 && movement < 10 && board[movement] == " " # We need to check if the position is available too
        puts "Now, your move is displayed on the board!"
        #board[movement] = symbol == "X" ? player ? "X" : "O" : player ? "X" : "O"
    else
        isValid = true
        puts "Invalid movement!!!!"
        next
    end
    if draw # We are going to check here if theres a draw
        clear
        putBoard board
        puts "Player #{player ? 1 : 2} move is a draw!"
        break
    end
    if false # We are going to check here if someone has won
        clear
        putBoard board
        puts "Player #{player ? 1 : 2} have won!"
        break
    end
    isValid = false
    draw = true
    player = !player
end




#!/usr/bin/env ruby
def putBoard
    puts "\nBoard:          Positions:\n\n"
    puts "___|___|___     1   2   3"
    puts "___|___|___     4   5   6"
    puts "   |   |        7   8   9"
end

def clear
    system "clear" or system "cls"
end

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
    putBoard
    puts "Turn"
    puts "Choose your next movement!"
    movement = gets.chomp.to_i
    if movement > 0 && movement < 10 # We need to check if the position is available too
        puts "Now, your move is displayed on the board!"
        #next
    else
        clear
        puts "Invalid movement!!!!"
        next
    end
    if 1 # We are going to check here if someone has won
        clear
        puts "You have won!"
        break
    end
end




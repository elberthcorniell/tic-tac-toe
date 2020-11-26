require_relative '../lib/game'

describe 'TicTacToe' do
    let(:symbol) { "X" }
    let(:name1) { "Juan" }
    let(:name2) { "Jose" }
    let(:game) { TicTacToe.new(symbol, name1, name2) }
    describe "#initialize" do 
        it "Creates a game with an empty board" do
            expect(game.board).to eql [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
        end
        it "Starts the game with player 1" do
            expect(game.get_player_name).to_not eql name2
        end
    end
    describe "#valid?" do
        it "Succesully denies movements in negative positions" do
            expect(game.valid?(-1)).to_not eql true
        end
        it "Succesully denies movements in positions bigger than 9" do
            expect(game.valid?10).to eql false
        end
        it "Succesully denies movements in occupied positions" do
            game.make_movement 4
            expect(game.valid?4).to eql false
        end
        it "Succesully accepts movements in valid positions" do
            expect(game.valid?5).to eql true
        end
    end
end
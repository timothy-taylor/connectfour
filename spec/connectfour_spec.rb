require './lib/connectfour.rb'

describe Grid do
  describe "#create_grid" do
    it "creates a 7x7 matrix" do
      grid = Grid.new
      expect(grid.create_grid).to eq(Array.new(7, Array.new(7)))
    end
  end
end

describe Gameplay do
  describe "#play_piece" do
    it "assigns a piece to the appropriate location in the grid" do
      game = Gameplay.new
      game.play_piece('X', 2)
      expect(game.play_piece('O', 2)).to eq(
        [ [nil, nil, nil, nil, nil, nil, nil], 
          [nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, 'O', nil, nil, nil, nil],
          [nil, nil, 'X', nil, nil, nil, nil] ])
    end
  end

  describe "#take_turns" do
    it "switches the player each turn" do
      game = Gameplay.new
      queue = []
      3.times do
        queue.push(game.take_turns)
      end
      expect(queue).to eq(['X', 'O', 'X'])
    end
  end

  describe "#win_conditions" do
    it "ends the game if four across is found" do
      game = Gameplay.new
      grid =  [ [nil, nil, nil, nil, nil, nil, nil], 
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, nil, nil, nil, nil, nil],
                [nil, nil, 'O', 'O', nil, nil, nil],
                ['X', 'X', 'X', 'X', 'O', 'O', nil] ]
      expect(game.win_conditions(grid)).to be(true)
    end
  end
end

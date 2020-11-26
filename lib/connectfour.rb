class Grid
  WINNING_COMBOS = [['X', 'X', 'X', 'X'],
                    ['O', 'O', 'O', 'O']]

  def create_grid
    Array.new(7) {Array.new(7)}
  end
end

class Gameplay < Grid
  attr_accessor :board, :turn_number, :game_over

  def initialize
    @board = create_grid
    @turn_number = 0
    @game_over = false
  end

  def play_piece(player, column, row = 6)
    until @board[row][column].nil?
      row -= 1
    end
    @board[row][column] = player
    return @board
  end

  def take_turns
    player = @turn_number.even? ? 'X' : 'O'
    @turn_number += 1
    return player
  end

  def win_conditions(board)
    if WINNING_COMBOS.any? do |combo|
      combo.all? { |position| @board[position] == 'X' }
    end
    game_over = true
  end
end

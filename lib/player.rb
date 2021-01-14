class Player
  attr_accessor :name, :symbol

  def initialize(name = nil, symbol = nil)
    @name = name
    @symbol = symbol
  end

  def valid_symbol(num)
    return true if num == 'X' || num == 'O'
  end

  def check_valid_move(user_input, board)
    return false if user_input.negative? && user_input > 9

    return true if board.empty?(user_input)

    false
  end
end

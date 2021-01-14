class Board
  attr_accessor :board
  def initialize
    @board = Array.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  def at(index)
    @board[index]
  end

  def replace(destination, source)
    i = 0
    while i < 9
      if @board[i] == destination
        @board[i] = source
        return true
      end
      i += 1
    end
  end

  def reset_board
    @board = Array.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  def empty?(user_input)
    i = 0
    while i < 9
      return true if @board[i] == user_input

      i += 1
    end
    false
  end

  def equal?(first, second, third)
    return true if board[first] == board[second] && board[second] == board[third]
  end
end

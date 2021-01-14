class Board
  def initialize
    @board = Array.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  def display_board
    i = 0
    while i < 9
      j = 0
      while j < 3
        print " #{@board[i]} "
        print '|' unless j == 2
        j += 1
        i += 1
      end
      puts "\n-----------"
    end
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
end

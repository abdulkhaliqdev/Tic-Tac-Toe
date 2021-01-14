class GameLogic < Board
  def horizontal_check(board)
    return true if board.equal?(0, 3, 6)

    return true if board.equal?(1, 4, 7)

    return true if board.equal?(2, 5, 8)
  end

  def vertical_check(board)
    return true if board.equal?(0, 1, 2)

    return true if board.equal?(3, 4, 5)

    return true if board.equal?(6, 7, 8)
  end

  def daignal_check(board)
    return true if board.equal?(0, 4, 8)

    return true if board.equal?(2, 4, 6)
  end

  def winner?(board)
    return true if horizontal_check(board)

    return true if vertical_check(board)

    return true if daignal_check(board)
  end
end

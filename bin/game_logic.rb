module GameLogic

  public 
  
  def check_valid_move(user_input, symbol, board)
    return false if user_input.negative? && user_input > 9

    i = 0
    while i < 9
      if board[i] == user_input
        board[i] = symbol
        return true
      end
      i += 1
    end
    false
  end

  def is_winner

  end
end

module GameLogic
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

  def play_turn(user, symbol, board)
    wrong_move = false
    player_turns = false
    while player_turns == false
      case wrong_move
      when false
        puts "#{user}! it is your turn"
      when true
        puts "#{user}! Wrong Move Try again!"
      end
      user_input = gets.chomp.to_i
      check_valid = check_valid_move(user_input, symbol, board)
      if check_valid
        player_turns = true
      else
        wrong_move = true
      end
    end
    false
  end

  def check_winner()
    
  end
end

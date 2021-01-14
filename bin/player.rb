class Player
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def valid_symbol(num)
    return true if num == 'X' || num == 'O'
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
        return user_input
      else
        wrong_move = true
      end
    end
    false
  end
end

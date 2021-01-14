class Computer
  def computer_play(player, board)
    computer_flag = false
    i = 0
    while computer_flag == false
      valid = player.check_valid_move(i, board)
      return i if valid
      i += 1
    end
    false
  end
end

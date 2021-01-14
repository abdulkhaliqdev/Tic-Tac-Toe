class Computer
  def computer_play(symbol, board)
    computer_flag = false
    i = 0
    while computer_flag == false
      valid = check_valid_move(i, symbol, board)
      computer_flag = true if valid
      i += 1
    end
    false
  end
end

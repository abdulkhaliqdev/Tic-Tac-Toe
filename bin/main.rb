#!/usr/bin/env ruby
playing = true
board = Array.new([[1,2,3],[4,5,6],[7,8,9]])

def check_valid_move(user_input, symbol, board)
  if user_input < 0 && user_input > 9
    return false
  end

  board.each do |i|
    i = 0
    j = 0
    while i < 3
      while j < 3
        if board[i][j] != 'X' && board[i][j] != 'O'
          board[i][j] = symbol
          return true
        end
        j += 1
      end
      i += 1
    end
  end
  return false
end
def play_turn(user,symbol,board)
  wrong_move = false
  player_turns = false
  winner = false
  while player_turns == false
    if  player_turns == false && wrong_move == false
      puts "#{user}! it is your turn"
      user_input = gets.chomp.to_i
      if check_valid_move(user_input, symbol, board)
        player_turns = true
      else
        wrong_move = true
      end
    else wrong_move == true
      puts "#{user}! Wrong Move Tey again!"
      user_input = gets.chomp.to_i
      if check_valid_move(user_input, symbol, board)
        player_turns = true
      else
        wrong_move = true
      end
    end
  end
  return false
end
def computer_play(symbol, board)
  computer_flag = false
  while computer_flag == false 
    move = rand 1..9
    if check_valid_move(move, symbol, board)
      return true
    end
  end
  return false
end
while playing
  invalid_input = false
  puts 'TIC TAC TOE'
  puts '--------------'
  puts 'Choose if you want to play with another player or against the machine.'
  puts 'For single-player -> Type: [ 1 ]'
  puts 'For multi-player -> Type: [ 2 ]'
  user = gets.chomp.to_i
  if user == 1
    puts 'You choose single-player!'
    puts ''
    puts 'What is your name?'
    user_name = gets.chomp
    puts ''
    puts "Lets get started... #{user_name}!"
    puts ''
    sleep(1)
    symbol_flag = false
    while symbol_flag == false
      puts 'What symbol do you want to play?'
      puts 'For X symbol -> Type: [ 1 ]'
      puts 'For O symbol -> Type: [ 2 ]'
      user_symbol = gets.chomp.to_i
      if user_symbol == 1 || user_symbol == 2
        symbol_flag = true
      else
        puts 'invalid input'
      end
    end
    computer_symbol = 'O' if user_symbol == 'X'
    computer_symbol = 'X' if user_symbol == 'O'
    flag = false
    turn = false
    count = 0
    while flag == false
      board.each do |i|
        j = 0
        while j < 3
          print " #{i[j]} "
          print '|' unless j == 2
          j += 1
        end
        puts "\n-----------"
      end
      if turn == false
        play_turn(user_name, user_symbol, board)
        turn = true
      else
        puts "Computer turn"
        computer_play(computer_symbol, board)
        turn = false
      end
      count += 1
      if count == 9
        flag = true
      end
    end
    puts "Great! you are the Winner of this game"
  elsif user == 2
    puts 'You choose multi-player!'
    puts ''
    puts 'What is the player 1 name?'
    player_one = gets.chomp
    puts ''
    puts "Lets get started... #{player_one}!"
    puts ''
    sleep(1)
    symbol_flag = false
    while symbol_flag == false
      puts 'What symbol do you want to play?'
      puts 'For X symbol -> Type: [ 1 ]'
      puts 'For O symbol -> Type: [ 2 ]'
      player_one_symbol = gets.chomp.to_i
      if player_one_symbol == 1 || player_one_symbol == 2
        symbol_flag = true
        player_one_symbol = 'X' if player_one_symbol == 1
        player_one_symbol = 'O' if player_one_symbol == 2
      else
        puts 'invalid input'
      end
    end
    puts 'What is the player 2 name?'
    player_two = gets.chomp
    puts ''
    puts "Lets get started... #{player_two}!"
    puts ''
    sleep(1)
    player_two_symbol = 'O' if player_one_symbol == 'X'
    player_two_symbol = 'X' if player_one_symbol == 'O'
    puts "Player 2 symbol is #{player_two_symbol}"
    flag = false
    count = 0
    turn =false
    # Multi-player
    while flag == false
      board.each do |i|
        j = 0
        while j < 3
          print " #{i[j]} "
          print '|' unless j == 2
          j += 1
        end
        puts "\n-----------"
      end
      if turn == false
        play_turn(player_one , player_one_symbol, board)
        turn = true
      else
        play_turn(player_two , player_two_symbol, board)
        turn = false
      end
      count += 1
      if count == 9
        flag = true
      end
    end
    puts "#{player_two}! Winner of  this game"
  else
    invalid_input = true
    puts ''
    puts 'Invalid input!'
    puts ''
  end

  if invalid_input == false
    puts 'Do you want to continue playing?'
    puts 'For YES -> Type: [ Y ]'
    puts 'For NO -> Type: [ N ]'
    a = gets.chomp
    if a == 'N' || a == 'n'
      playing = false
    else
      puts ''
      puts 'OK, Restarting the game!'
      puts ''
    end

  end

end
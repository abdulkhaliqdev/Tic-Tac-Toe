#!/usr/bin/env ruby
playing = true
board = Array.new([1, 2, 3, 4, 5, 6, 7, 8, 9])




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
      puts "#{user}! Wrong Move Tey again!"
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

while playing
  invalid_input = false
  puts 'TIC TAC TOE'
  puts '--------------'
  puts 'Choose if you want to play with another player or against the machine.'
  puts 'For single-player -> Type: [ 1 ]'
  puts 'For multi-player -> Type: [ 2 ]'
  user = gets.chomp.to_i
  case user
  when 1
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
        user_symbol = 'X' if user_symbol == 1
        user_symbol = 'O' if user_symbol == 2
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
      i = 0
      while i < 9
        j = 0
        while j < 3
          print " #{board[i]} "
          print '|' unless j == 2
          j += 1
          i += 1
        end
        puts "\n-----------"
      end
      if turn == false
        play_turn(user_name, user_symbol, board)
        turn = true
      else
        puts 'Computer turn'
        flag = computer_play(computer_symbol, board)
        turn = false
      end
      count += 1
      flag = true if count == 9
    end
    puts 'Great! you are the Winner of this game'
    board = Array.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
  when 2
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
    turn = false
    # Multi-player
    while flag == false
      i = 0
      while i < 9
        j = 0
        while j < 3
          print " #{board[i]} "
          print '|' unless j == 2
          j += 1
          i += 1
        end
        puts "\n-----------"
      end
      if turn == false
        play_turn(player_one, player_one_symbol, board)
        turn = true
      else
        play_turn(player_two, player_two_symbol, board)
        turn = false
      end
      count += 1
      flag = true if count == 9
    end
    puts "#{player_two}! Winner of  this game"
    board = Array.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
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

#!/usr/bin/env ruby
checks = Array.new([
  [1,5,9],
  [3,5,7],
  [1,2,3],
  [1,4,7],
  [7,8,9],
  [3,6,9],
  [2,5,8],
  [4,5,6]
])
p_one_moves = Array.new()
p_two_moves = Array.new()

playing = true
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

    flag = false
    player_turn = false
    wrong_move = false
    winner = false

    board = Array.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    while flag == false

      puts " #{board[0]} | #{board[1]} | #{board[2]} "
      puts ' --------- '
      puts " #{board[3]} | #{board[4]} | #{board[5]} "
      puts ' --------- '
      puts " #{board[6]} | #{board[7]} | #{board[8]} "
      if wrong_move == true
        puts "Invalid input, choose a number between #{board}"
      end
      
      if player_turn == true
        puts "Its your turn #{user}"
      end

      
      flag = true
      if winner == true
        puts "Congratulations #{user}, you won the match"
      end
    end

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
    while flag == false
      puts ' 1 | 2 | 3 '
      puts ' --------- '
      puts ' 4 | 5 | 6 '
      puts ' --------- '
      puts ' 7 | 8 | 9 '
      flag = true
    end
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

def winner(user)
  puts "Congratulations #{user}... you won the match."
end

def check_winner(a, b, c)
  if a == b && a == c
    return true
  end
  return false
end



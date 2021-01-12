#!/usr/bin/env ruby
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
    wrong_move = false
    player_turn = false
    winner = false
    while flag == false
      puts ' 1 | 2 | 3 '
      puts ' --------- '
      puts ' 4 | 5 | 6 '
      puts ' --------- '
      puts ' 7 | 8 | 9 '

      if wrong_move == true
        puts ''
        puts "Invalid move! Repeat your movement #{user_name}"
        puts
      end

      player_turn = true

      if player_turn == true
        puts ''
        puts "It's your turn #{user_name}"
        puts ''
      end
      sleep(1)
      puts ' 1 | 2 | 3 '
      puts ' --------- '
      puts ' 4 | 5 | 6 '
      puts ' --------- '
      puts ' 7 | 8 | 9 '

      winner = true

      if winner == true
        puts ''
        puts "Congratulations, #{user_name}... you won the match."
        puts ''
      end
      flag = true
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

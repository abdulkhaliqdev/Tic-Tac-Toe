#!/usr/bin/env ruby
playing = true
board = Array.new([[1,2,3],[4,5,6],[7,8,9]])  

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
    puts 'Welcome... {}'
    symbol_flag = false
    while symbol_flag == false
      puts 'What symbol do you want to play?'
      puts 'For X symbol -> Type: [ 1 ]'
      puts 'For O symbol -> Type: [ 2 ]'
      user_symbol = gets.chomp.to_i
      if user_symbol == 1 || user_symbol == 2
        symbol_flag = true
      else
        puts "invalid input"
      end
    end

    flag = false
    player_turn = false
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
      if player_turn == false
        puts "#{user}! it is your turn"
        user_input = gets.chomp.to_i
        check_move = check_place(user_input)
        if(check_move == true)
          i_index, j_index= replace_index(user_symbol)
          winner_flag = check_winner(user_symbol,i_index,j_index)
          if(winner_flag == true)
            winner(user_name)
            break
          end
        else
          puts 'Invalid Move! Try again.'
        end
      else
        computer
      end
      flag = true
    end
  elsif user == 2
    puts 'You choose multi-player!'
    puts ''
    puts 'What is the player 1 name?'
    player_one = gets.chomp
    puts ''
    symbol_flag = false
    while symbol_flag == false
      puts 'What symbol do you want to play?'
      puts 'For X symbol -> Type: [ 1 ]'
      puts 'For O symbol -> Type: [ 2 ]'
      player_one_symbol = gets.chomp.to_i
      if player_one_symbol == 1 || player_one_symbol == 2
        symbol_flag = true
        player_one_symbol = "X" if player_one_symbol == 1
        player_one_symbol = "O" if player_one_symbol == 2
      else
        puts "invalid input"
      end
    end
    puts 'What is the player 2 name?'
    player_two = gets.chomp
    puts ''
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

def check_winner(a, b, c)
  if a == b && a == c
    return true
  end
  return false
end

def check_winner(symbol,i,j)
  if (i)
end

#!/usr/bin/env ruby
require_relative 'board'
require_relative 'player'
require_relative 'computer_logic'
require_relative 'game_logic'

playing = true
board = Board.new

def play_turn(user, board)
  wrong_move = false
  player_turns = false
  while player_turns == false
    case wrong_move
    when false
      puts "#{user.name}! it is your turn"
    when true
      puts "#{user.name}! Wrong Move Tey again!"
    end
    user_input = gets.chomp.to_i
    check_valid = user.check_valid_move(user_input, board)
    if check_valid
      return user_input
    else
      wrong_move = true
    end
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
    player = Player.new(user_name, user_symbol)
    computer = Computer.new
    gamelogic = GameLogic.new
    board.display_board
    while flag == false
      if turn == false
        input = play_turn(player, board)
        board.replace(input, user_symbol)
        if gamelogic.winner?(board)
          flag = true
          puts ''
          puts 'You are the winner!!!'
          puts ''
        end
        turn = true
      else
        puts 'Computer turn'
        computer_input = computer.computer_play(player, board)
        board.replace(computer_input, computer_symbol)
        if gamelogic.winner?(board)
          flag = true
          puts ''
          puts 'Computer is the winner!!!'
          puts ''
        end
        turn = false
      end
      count += 1
      if count == 9 && flag == false
        flag = true
        puts ''
        puts "It's a draw!"
        puts ''
      end
      board.display_board
    end
    board.reset_board
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
    player1 = Player.new(player_one, player_one_symbol)
    player2 = Player.new(player_two,player_two_symbol)
    gamelogic = GameLogic.new
    # Multi-player
    board.display_board
    
    while flag == false
      if turn == false
        input = play_turn(player1, board)
        board.replace(input, player1.symbol)
        if gamelogic.winner?(board)
          flag = true
          puts ''
          puts 'Player one is the winner!!!'
          puts ''
        end
        turn = true
      else
        input = play_turn(player2, board)
        board.replace(input, player2.symbol)
        if gamelogic.winner?(board)
          flag = true
          puts ''
          puts 'Player two is the winner!!!'
          puts ''
        end
        turn = false
      end
      count += 1
      if count == 9 && flag == false
        flag = true
        puts ''
        puts "It's a draw!"
        puts ''
      end
      board.display_board
    end
    board.reset_board
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

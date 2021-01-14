#!/usr/bin/env ruby
require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/computer_logic'
require_relative '../lib/game_logic'

playing = true
board = Board.new

def display_board(board)
  puts ''
  i = 0
  while i < 9
    j = 0
    while j < 3
      print " #{board.board[i]} "
      print '|' unless j == 2
      j += 1
      i += 1
    end
    puts "\n-----------"
  end
  puts ''
end

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
    return user_input if check_valid

    wrong_move = true unless check_valid
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
    player = Player.new
    puts 'You choose single-player!'
    puts ''
    puts 'What is your name?'
    player.name = gets.chomp
    puts ''
    puts "Lets get started... #{player.name}!"
    puts ''
    sleep(1)
    symbol_flag = false
    while symbol_flag == false
      puts 'What symbol do you want to play?'
      puts 'For X symbol -> Type: [ 1 ]'
      puts 'For O symbol -> Type: [ 2 ]'
      player.symbol = gets.chomp.to_i
      if player.symbol == 1 || player.symbol == 2
        symbol_flag = true
        player.symbol = 'X' if player.symbol == 1
        player.symbol = 'O' if player.symbol == 2
      else
        puts 'invalid input'
      end
    end
    computer_symbol = 'O' if player.symbol == 'X'
    computer_symbol = 'X' if player.symbol == 'O'
    flag = false
    turn = false
    count = 0
    computer = Computer.new
    gamelogic = GameLogic.new
    display_board(board)
    while flag == false
      if turn == false
        input = play_turn(player, board)
        board.replace(input, player.symbol)
        if gamelogic.winner?(board)
          flag = true
          puts ''
          puts "You are the winner #{player.name}!!!"
          puts ''
        end
        turn = true
      else
        puts 'Computer turn'
        computer_input = computer.computer_play(player, board)
        board.replace(computer_input, computer_symbol)
        sleep(1)
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
        puts "It's a Draw!"
        puts ''
      end
      display_board(board) if flag == false
    end
    board.reset_board
  when 2
    player1 = Player.new
    player2 = Player.new
    puts 'You choose multi-player!'
    puts ''
    puts 'What is the player 1 name?'
    player1.name = gets.chomp
    puts ''
    puts "Lets get started... #{player1.name}!"
    puts ''
    sleep(1)
    symbol_flag = false
    while symbol_flag == false
      puts 'What symbol do you want to play?'
      puts 'For X symbol -> Type: [ 1 ]'
      puts 'For O symbol -> Type: [ 2 ]'
      player1.symbol = gets.chomp.to_i
      if player1.symbol == 1 || player1.symbol == 2
        symbol_flag = true
        player1.symbol = 'X' if player1.symbol == 1
        player1.symbol = 'O' if player1.symbol == 2
      else
        puts 'invalid input'
      end
    end
    puts 'What is the player 2 name?'
    player2.name = gets.chomp
    puts ''
    puts "Lets get started... #{player2.name}!"
    puts ''
    sleep(1)
    player2.symbol = 'O' if player2.symbol == 'X'
    player2.symbol = 'X' if player2.symbol == 'O'
    puts "Player 2 symbol is #{player2.symbol}"
    flag = false
    count = 0
    turn = false
    gamelogic = GameLogic.new
    # Multi-player
    display_board(board)
    while flag == false
      if turn == false
        input = play_turn(player1, board)
        board.replace(input, player1.symbol)
        if gamelogic.winner?(board)
          flag = true
          puts ''
          puts "#{player1.name} is the winner!!!"
          puts ''
        end
        turn = true
      else
        input = play_turn(player2, board)
        board.replace(input, player2.symbol)
        if gamelogic.winner?(board)
          flag = true
          puts ''
          puts "#{player2.name} is the winner!!!"
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
      display_board(board) if flag == false
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

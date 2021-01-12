
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

  elsif user == 2
    puts 'You choose multi-player!'
    puts ''
    puts 'What is the player 1 name?'
    player_one = gets.chomp
    puts ''
    puts 'What is the player 2 name?'
    player_two = gets.chomp
    puts ''
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
      puts 'Invalid input!'
      puts ''
      playing = false
    end
  end
end



# puts ' 1 | 2 | 3 '
# puts ' --------- '
# puts ' 4 | 5 | 6 '
# puts ' --------- '
# puts ' 7 | 8 | 9 '

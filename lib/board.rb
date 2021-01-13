
class Board

  def initialize
    @places = {1 => '1', 2 => '2', 3 => '3',
               4 => '4', 5 => '5', 6 => '6',
               7 => '7', 8 => '8', 9 => '9'}
  end

  def draw_board
    puts "#{@places[1]} | #{@places[2]} | #{@places[3]} "
    puts '-----------'
    puts "#{@places[4]} | #{@places[5]} | #{@places[6]} "
    puts '-----------'
    puts "#{@places[7]} | #{@places[8]} | #{@places[9]} "
    puts '-----------'
    puts @places
  end

end

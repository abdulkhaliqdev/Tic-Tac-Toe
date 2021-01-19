# spec/calculator_spec.rb

require './lib/board'

describe Board do
  describe '#replace' do
    it 'return true if destination is 1 upto 9 and update the board' do
      my_board = Board.new
      expect(my_board.replace(1, 'x')).to eql(true)
    end
  end

  describe '#equal?' do
    it 'return true if the elements at those index are equal' do
      board = Board.new
      symbol = 'X'
      board.reset_board
      board.replace(1, symbol)
      board.replace(4, symbol)
      board.replace(7, symbol)
      expect(board.equal?(0, 3, 6)).to eql(true)
    end
  end
end

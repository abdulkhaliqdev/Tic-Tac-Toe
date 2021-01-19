# spec/calculator_spec.rb

require './lib/board'

describe Board do
  describe '#replace' do
    it 'return true if destination is 1 upto 9 and update the board' do
      my_board = Board.new
      expect(my_board.replace(1, 'x')).to eql(true)
    end
  end
end

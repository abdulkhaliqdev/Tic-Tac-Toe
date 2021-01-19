# spec/game_logic_test_spec.rbc

require '../lib/board'
require '../lib/game_logic'
describe GameLogic do
  gamelogic = GameLogic.new
  board = Board.new
  symbol = 'X'
  describe '#horizontal_check' do
    it 'return ture if (0 , 3, 6) indexs have Symbol "X"' do
      board.reset_board
      board.replace(1, symbol)
      board.replace(4, symbol)
      board.replace(7, symbol)
      expect(gamelogic.horizontal_check(board)).to eql(true)
    end

    it 'return ture if (1 , 4, 7) indexs have Symbol "X"' do
      board.reset_board
      board.replace(2, symbol)
      board.replace(5, symbol)
      board.replace(8, symbol)
      expect(gamelogic.horizontal_check(board)).to eql(true)
    end

    it 'return ture if (2 , 5, 8) indexs have Symbol "X"' do
      board.reset_board
      board.replace(3, symbol)
      board.replace(6, symbol)
      board.replace(9, symbol)
      expect(gamelogic.horizontal_check(board)).to eql(true)
    end
  end

  describe '#vertical_check' do
    it 'return ture if (0, 1, 2) indexs have Symbol "X"' do
      board.reset_board
      board.replace(1, symbol)
      board.replace(2, symbol)
      board.replace(3, symbol)
      expect(gamelogic.vertical_check(board)).to eql(true)
    end

    it 'return ture if (3, 4, 5) indexs have Symbol "X"' do
      board.reset_board
      board.replace(4, symbol)
      board.replace(5, symbol)
      board.replace(6, symbol)
      expect(gamelogic.vertical_check(board)).to eql(true)
    end

    it 'return ture if (6, 7, 8) indexs have Symbol "X"' do
      board.reset_board
      board.replace(7, symbol)
      board.replace(8, symbol)
      board.replace(9, symbol)
      expect(gamelogic.vertical_check(board)).to eql(true)
    end
  end

  describe '#daignal_check' do
    it 'return true if (1, 5, 9) are equal' do
      board.reset_board
      board.replace(1, symbol)
      board.replace(5, symbol)
      board.replace(9, symbol)
      expect(gamelogic.daignal_check(board)).to eql(true)
    end

    it 'return true if (3, 5, 7) are equal' do
      board.reset_board
      board.replace(3, symbol)
      board.replace(5, symbol)
      board.replace(7, symbol)
      expect(gamelogic.daignal_check(board)).to eql(true)
    end
  end
end

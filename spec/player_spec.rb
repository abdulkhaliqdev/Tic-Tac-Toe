# spec/calculator_spec.rb

require './lib/player'

describe Player do
  describe '#valid_symbol' do
    it 'return true if num=X or if it equal O' do
      my_player = Player.new
      expect(my_player.valid_symbol('X')).to eql(true)
    end

    it 'return true if num=X or if it equal O' do
      my_player = Player.new
      expect(my_player.valid_symbol('O')).to eql(true)
    end
  end
end

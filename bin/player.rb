class Player
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def valid_symbol(num)
    return true if num == 'X' || num == 'O'
  end
end

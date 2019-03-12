class Card
  attr_accessor :suit, :number
  def initialize(suit, number)
    @suit = suit
    @number = number
  end

  def show_card
    puts ("#{suit}""#{number}")
  end
end


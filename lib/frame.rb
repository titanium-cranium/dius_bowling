class Frame
  attr_accessor :id, :ball_one, :ball_two

  def initialize(id:)
    @id = id
    @ball_one = 0
    @ball_two = 0
  end

  def bowl
    @ball_one = roll(pins: 10)
    @ball_two = roll(pins: 10 - @ball_one) unless @ball1 == 10
  end

  def roll(pins: 10)
    rand(1..pins)
  end
end


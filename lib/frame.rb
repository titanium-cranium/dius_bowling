# frozen_string_literal: true

class Frame
  attr_accessor :id, :ball_one, :ball_two, :ball_three

  def initialize(id:)
    @id = id
    @ball_one = nil
    @ball_two = nil
    @ball_three = nil
  end

  def bowl
    roll_ball_one
    roll_ball_two unless @ball_one == 10
    endgame if id == 10
  end

  def results
    [@ball_one, @ball_two, @ball_three].compact
  end

  def roll_ball_one
    @ball_one = roll(pins: 10)
  end

  def roll_ball_two
    pins = 10 - @ball_one
    @ball_two = roll(pins: pins)
  end

  def roll(pins:)
    rand(0..pins)
  end

  private

  def endgame
    if @ball_one == 10
      roll_ball_two
      @ball_three = @ball_two == 10 ? roll(pins: 10) : roll(pins: 10 - @ball_two)
    elsif @ball_one + @ball_two == 10
      @ball_three = roll(pins: 10)
    end
  end
end

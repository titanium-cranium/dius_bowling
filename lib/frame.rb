# frozen_string_literal: true

class Frame
  attr_accessor :id, :ball_one, :ball_two

  def initialize(id:)
    @id = id
    @ball_one = nil
    @ball_two = nil
  end

  def bowl
    roll_ball_one
    roll_ball_two unless @ball_one == 10
  end

  def results
    [@ball_one, @ball_two].compact
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
end

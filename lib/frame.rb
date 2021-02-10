# frozen_string_literal: true

class Frame
  attr_accessor :id, :ball_one, :ball_two, :ball_three, :complete

  def initialize(id:)
    @id = id
    @ball_one = nil
    @ball_two = nil
    @ball_three = nil
    @complete = false
  end

  def bowl(pins)
    return if complete

    if @ball_one.nil?
      roll_ball_one(pins)
    elsif @ball_two.nil?
      roll_ball_two(pins)
    else
      roll_ball_three(pins)
    end
  end

  def results
    [@ball_one, @ball_two, @ball_three].compact
  end

  def roll_ball_one(pins)
    @ball_one = pins
    @complete = true if @ball_one == 10 && id != 10
  end

  def roll_ball_two(pins)
    @ball_two = pins
    if id == 10
      @complete = true if @ball_one + @ball_two < 10
    else
      @complete = true
    end
  end

  def roll_ball_three(pins)
    @ball_three = pins
    @complete = true
  end
end

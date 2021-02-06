# frozen_string_literal: true

require_relative './frame'

class Game
  attr_reader :score, :frames

  def initialize
    @score = 0
    @frames = []
  end

  def setup
    (1..10).to_a.each do |id|
      frame = Frame.new(id: id)
      frames << frame
    end
  end

  def play
    frames.each(&:bowl)
  end

  def score; end
end

# frozen_string_literal: true

require_relative './frame'

class Game
  attr_reader :frames

  def initialize
    @frames = []
    setup
  end

  def play
    frames.each(&:bowl)
  end

  def total_score
    frames.collect { |frame| frame_score(frame) }.reduce(&:+)
  end

  private

  def setup
    (1..10).to_a.each do |id|
      frame = Frame.new(id: id)
      frames << frame
    end
  end

  def frame_score(frame)
    rolls = frame.results
    if rolls.reduce(&:+) == 10
      advance_frames = get_two_more_frames(frame.id).flatten
      rolls = if frame.ball_one == 10
                (rolls << advance_frames.slice(0, 2)).flatten
              else
                (rolls << advance_frames.slice(0, 1)).flatten
              end
    end
    rolls.reduce(&:+)
  end

  def get_two_more_frames(frame_id)
    advance_frames = frames.select { |frame| frame.id == frame_id + 1 || frame.id == frame_id + 2 }
    advance_frames.collect(&:results)
  end
end

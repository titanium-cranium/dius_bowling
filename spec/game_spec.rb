# frozen_string_literal: true

require 'rspec'
require_relative '../lib/game'

RSpec.describe Game do
  let(:game) { Game.new }
  describe('#setup') do
    it 'should create 10 frames' do
      game.setup
      expect(game.frames.count).to eq(10)
    end
  end

  describe('#play') do
    let(:frame_id) { rand(1..10) }
    it 'should fill each frame' do
      game.setup
      game.play
      expect(game.frames.find { |frame| frame.ball_one.nil? }).to be(nil)
    end
  end

  describe('#total_score') do
    let(:game) { Game.new }
    it 'should return 300 for a perfect game score' do
      game.setup
      game.frames.map { |frame| frame.ball_one = 10 }
      expect(game.total_score).to eq(300)
    end

    it 'should return 150 for an all fives game score' do
      game.setup
      game.frames.map { |frame| frame.ball_one = 5 }
      game.frames.map { |frame| frame.ball_two = 5 }
      expect(game.total_score).to eq(150)
    end

    it 'should return 90 for an all nine game score ' do
      game.setup
      game.frames.map { |frame| frame.ball_one = 5 }
      game.frames.map { |frame| frame.ball_two = 4 }
      expect(game.total_score).to eq(90)
    end
  end
end

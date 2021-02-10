# frozen_string_literal: true

require 'rspec'
require_relative '../lib/game'

RSpec.describe Game do

  describe("#roll") do
    let(:game) {Game.new}

    it "should update the current frame" do
      game.roll(10)
      expect(game.frames.first.ball_one).to eq(10)
    end
  end


  describe('#score') do
    let(:game) { Game.new }

    it 'should return 10 for a strike in the first frame' do
      game.roll(10)
      expect(game.score).to eq(10)
    end

    it 'should return 4 for the first ball' do
      game.roll(4)
      expect(game.score).to eq(4)
    end

    it 'should return 16 for four rolls of four' do
      4.times do
        game.roll(4)
      end
      expect(game.score).to eq(16)
    end

    it 'should return 300 for a perfect game score' do
      12.times do
        game.roll(10)
      end
      expect(game.score).to eq(300)
    end

    it 'should return 150 for an all fives game score' do
      21.times do
        game.roll(5)
      end
      expect(game.score).to eq(150)
    end

    it 'should return 90 for an all nine game score ' do
      10.times do
        game.roll(5)
        game.roll(4)
      end
      expect(game.score).to eq(90)
    end
  end
end

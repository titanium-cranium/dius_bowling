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
      expect(game.frames.select { |frame| frame.id = frame_id }.first.ball_one).to be > 0
    end
  end

  describe("#score") do
  end
end

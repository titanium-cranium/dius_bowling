# frozen_string_literal: true

require 'rspec'
require_relative '../lib/frame'

RSpec.describe Frame do
  let(:frame) { Frame.new(id: 1) }
  describe '#bowl' do
    it 'sets the ball_one instance variables' do
      frame.bowl
      expect(frame.ball_one).to_not be(nil)
    end
  end

  describe '#roll' do
    let(:pins) { 5 }
    it 'returns an int between 0 and pins' do
      expect(frame.roll(pins: pins)).to be_between(0, pins)
    end
  end

  describe '#results' do
    let(:frame) { Frame.new(id: 1) }
    context 'when the total is less than 10' do
      it 'returns an array [ball_one, ball_two]' do
        frame.ball_one = 3
        frame.ball_two = 6
        expect(frame.results).to eq([3, 6])
      end
    end

    context 'when the frame is a spare' do
      it 'returns an array [ball_one, ball_two' do
        frame.ball_one = 2
        frame.ball_two = 8
        expect(frame.results).to eq([2, 8])
      end
    end

    context 'when the frame is a strike' do
      it 'returns a single array, value 10' do
        frame.ball_one = 10
        expect(frame.results).to eq([10])
      end
    end
  end
end

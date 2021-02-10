# frozen_string_literal: true

require 'rspec'
require_relative '../lib/frame'

RSpec.describe Frame do
  let(:frame) { Frame.new(id: 1) }
  describe '#bowl' do
    context 'frame is open' do
      let(:pins) { 6 }
      it 'sets the ball_one score' do
        frame.bowl(pins)
        expect(frame.ball_one).to be(pins)
        expect(frame.complete).to be(false)
      end
    end

    context 'ball one is a strike' do
      let(:pins) { 10 }
      it 'sets the ball_one score' do
        frame.id = 3
        frame.bowl(pins)
        expect(frame.ball_one).to be(pins)
        expect(frame.complete).to be(true)
      end
    end

    context 'ball one is a strike in frame 10' do
      let(:pins) { 10 }
      it 'sets the ball_one score' do
        frame.id = 10
        frame.bowl(pins)
        expect(frame.ball_one).to be(pins)
        expect(frame.complete).to be(false)
      end
    end

    context 'ball one is already rolled' do
      let(:pins) { 6 }
      it 'sets the ball_two score' do
        frame.ball_one = 3
        frame.bowl(pins)
        expect(frame.ball_two).to be(6)
        expect(frame.complete).to be(true)
      end
    end

    context 'ball one and two are are strikes in frame 10' do
      it 'sets the ball_three score' do
        frame.id = 10
        3.times do
          frame.bowl(10)
        end
        expect(frame.ball_three).to be(10)
      end
    end

    context 'sum of ball one and two are < 10 in frame 10' do
      it 'sets the ball_three score' do
        frame.id = 10
        2.times do
          frame.bowl(3)
        end
        expect(frame.complete).to be(true)
      end
    end

    context ' ball one and two make a spare in frame 10' do
      it 'keeps the frame open' do
        frame.id = 10
        2.times do
          frame.bowl(5)
        end
        expect(frame.complete).to be(false)
      end
    end

    context 'a spare in frame 10' do
      it 'allows ball three to be set' do
        frame.id = 10
        3.times do
          frame.bowl(5)
        end
        expect(frame.ball_three).to be(5)
      end
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
      it 'returns an array [ball_one, ball_two]' do
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

    context 'when frame 10 includes a spare' do
      it 'returns an array of three values' do
        frame.id = 10
        3.times do
          frame.bowl(5)
        end
        expect(frame.results).to eq([5,5,5])
      end
    end
  end
end

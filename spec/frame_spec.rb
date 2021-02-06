require 'rspec'
require_relative '../lib/frame'

RSpec.describe Frame do
  let(:frame) {Frame.new(id: 1)}
  describe '#bowl' do
    it "sets both instance variables" do
      frame.bowl
      expect(frame.ball_one).to be > 0
      expect(frame.ball_two).to be > 0
    end
  end

  describe '#roll' do
    let(:pins) { 5 }
    it 'returns an int between 1 and pins' do
      expect(frame.roll(pins: pins)).to be_between(1, pins)
    end
  end
end
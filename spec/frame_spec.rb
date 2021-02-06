require 'rspec'
require_relative '../lib/frame'

RSpec.describe Frame do
  let(:frame) {Frame.new(id: 1)}
  describe '#bowl' do
    it "sets the ball_one instance variables" do
      frame.bowl
      expect(frame.ball_one).to_not be(nil)
    end

    xit "doesn't set ball two if ball one is a strike" do
      allow(frame).should_receive(:roll_ball_one).and_return(10)
      frame.bowl
    end
  end

  describe '#roll' do
    let(:pins) { 5 }
    it 'returns an int between 0 and pins' do
      expect(frame.roll(pins: pins)).to be_between(0, pins)
    end
  end
end
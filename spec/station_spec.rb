require 'station'
require 'oystercard'

describe Station do
  describe '#station' do
    it 'responds to .station' do
      expect(subject).to respond_to :station
    end

    it 'returns the station the card last tapped into' do
      card = Oystercard.new
      card.top_up(5)
      card.tap_in("Cockfosters")
      expect(card.station).to eq "Cockfosters"
    end
  end
end

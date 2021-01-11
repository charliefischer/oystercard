# frozen_string_literal: true

require 'oystercard'

describe Oystercard do
  describe '#balance' do
    it 'expects initial balance to be 0' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'responds to .top_up' do
      expect(subject).to respond_to :top_up
    end
    it 'tops up balance by 5' do
      subject.top_up(5)
      expect(subject.balance).to eq 5
    end
    it 'returns an error when the balance exceeds 90' do
      subject.top_up(80)
      expect { subject.top_up(20) }.to raise_error("Top up not completed, #{Oystercard::MAX_AMOUNT} maximum balance exceeded.")
    end
  end
end

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
      expect do
        subject.top_up(20)
      end.to raise_error("Top up not completed, #{Oystercard::MAX_AMOUNT} maximum balance exceeded.")
    end
  end

  describe '#deduct' do
    it { is_expected.to respond_to :deduct }

    it 'is expected to reduce the balance by the specified sum' do
      subject.top_up(90)
      expect(subject.deduct(5)).to eq 85
    end
  end

  describe '#tap_in' do
    it { is_expected.to respond_to :tap_in }

    it 'is expected to recognise that it has been tapped in' do
      expect(subject.tap_in).to eq 'tapped in'
    end
  end
end

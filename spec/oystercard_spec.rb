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
      subject.top_up(Oystercard::MAX_AMOUNT)
      expect do
        subject.top_up(5)
      end.to raise_error("Top up not completed, #{Oystercard::MAX_AMOUNT} maximum balance exceeded.")
    end
  end

  describe '#deduct' do
    it { is_expected.to respond_to :deduct }

    it 'is expected to reduce the balance by the specified sum' do
      subject.top_up(Oystercard::MAX_AMOUNT)
      expect(subject.deduct(5)).to eq 85
    end
  end

  describe '#tap_in' do
    it { is_expected.to respond_to :tap_in }

    it 'will return true when an oystercard with a sufficient balance tapped in' do
      subject.top_up(Oystercard::MIN_AMOUNT)
      expect(subject.tap_in).to eq true
    end

    it 'will return an error if the balance is under 1' do
      expect { subject.tap_in }.to raise_error("Insufficient balance on card.")
    end
  end

  describe '#tap_out' do
    it { is_expected.to respond_to :tap_out }

    it 'will return false when tapped out' do
      expect(subject.tap_out).to eq false
    end
  end

  describe '#in_journey?' do
    it { is_expected.to respond_to :in_journey? }

    it 'will return true if an oystercard with a sufficient balance is in use in a journey' do
      subject.top_up(Oystercard::MIN_AMOUNT)
      subject.tap_in
      expect(subject.in_journey?).to eq true
    end
  end
end

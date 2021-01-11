# frozen_string_literal: true

require 'oystercard'

describe Oystercard do
  describe 'balance' do
    it 'expects initial balance to be 0' do
      expect(subject.balance).to eq 0
    end
  end
end

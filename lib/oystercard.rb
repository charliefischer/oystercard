# frozen_string_literal: true

class Oystercard
  attr_reader :balance, :status

  MAX_AMOUNT = 90

  def initialize
    @balance = 0
    @status = 'tapped_out'
  end

  def top_up(amount)
    raise "Top up not completed, #{MAX_AMOUNT} maximum balance exceeded." if (@balance + amount) > MAX_AMOUNT

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def tap_in
    @status = 'tapped in'
  end
end

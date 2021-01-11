# frozen_string_literal: true

class Oystercard
  attr_reader :balance, :status

  MAX_AMOUNT = 90
  MIN_AMOUNT = 1

  def initialize
    @balance = 0
    @status = false
  end

  def top_up(amount)
    raise "Top up not completed, #{MAX_AMOUNT} maximum balance exceeded." if (@balance + amount) > MAX_AMOUNT

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def tap_in
    fail "Insufficient balance on card." if @balance < MIN_AMOUNT
    @status = true
  end

  def tap_out
    @status = false
  end

  def in_journey?
    @status
  end
end

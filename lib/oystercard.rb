# frozen_string_literal: true

class Oystercard
  attr_reader :balance, :in_journey

  MAX_AMOUNT = 90
  MIN_AMOUNT = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Top up not completed, #{MAX_AMOUNT} maximum balance exceeded." if (@balance + amount) > MAX_AMOUNT

    @balance += amount
  end

  def tap_in
    raise 'Insufficient balance on card.' if @balance < MIN_AMOUNT

    @in_journey = true
  end

  def tap_out(amount = MIN_FARE)
    @in_journey = false
    deduct(amount)
  end

  def in_journey?
    @in_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end

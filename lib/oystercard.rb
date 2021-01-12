require 'station'

class Oystercard
  attr_reader :balance, :in_journey
  attr_accessor :station

  MAX_AMOUNT = 90
  MIN_AMOUNT = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
    @station = nil
  end

  def top_up(amount)
    raise "Top up not completed, #{MAX_AMOUNT} maximum balance exceeded." if (@balance + amount) > MAX_AMOUNT

    @balance += amount
  end

  def tap_in(station)
    raise 'Insufficient balance on card.' if @balance < MIN_AMOUNT

    @station = station
    @in_journey = true
  end

  def tap_out
    @in_journey = false
    deduct(MIN_FARE)
  end

  def in_journey?
    @in_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end

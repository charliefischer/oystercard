# frozen_string_literal: true

class Oystercard

  attr_reader :balance

  MAX_AMOUNT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Top up not completed, #{MAX_AMOUNT} maximum balance exceeded." if (@balance + amount) > MAX_AMOUNT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

end

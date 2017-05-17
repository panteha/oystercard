require_relative './station.rb'
require_relative './journey.rb'

class Oystercard
  attr_accessor :balance, :list_of_journeys
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize(balance = 0)
    @journey = nil
    @balance = balance
    @list_of_journeys = []
  end

  def top_up(amount)
    raise 'Maximum balance exceeded!' if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    !@journey.nil? && !@journey.complete?
  end

  def tap_in(entry_station)
    deduct(@journey.calculate_cost) if in_journey?
    raise 'Not enough funds' if @balance < MINIMUM_BALANCE
    @journey = Journey.new(entry_station)
  end

  def tap_out(exit_station)
    @journey.finish(exit_station)
    deduct(@journey.calculate_cost)
    @list_of_journeys << @journey
  end

end

# Card and stations for tests:
card = Oystercard.new(20)
highgate = Station.new('Highgate', 3)
euston = Station.new('Euston', 1)

# One complete journey:
card.tap_in(highgate)
card.tap_out(euston)

# Unfinished journey:
card.tap_in(highgate)
card.tap_in(euston)

puts card.balance
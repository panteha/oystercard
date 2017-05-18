class Oystercard
  attr_accessor :balance, :list_of_journeys
  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1

  def initialize()
    @balance = 0
    @journeylog = JourneyLog.new(Journey)
  end

  def top_up(amount)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance = @balance + amount
  end

  def deduct(amount)
  	@balance -= amount
  end

  def in_journey?
    @journeylog.in_journey?
  end

  def tap_in(entry_station)
    raise "Not enough funds" if @balance < 1
    tap_out(nil) if in_journey?
    @journeylog.start(entry_station)
  end

  def tap_out(exit_station)
    journey = @journeylog.finish(exit_station)
    deduct(journey.fare)
  end


end

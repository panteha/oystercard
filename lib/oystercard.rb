class Oystercard
  attr_accessor :balance, :list_of_journeys
  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1

  def initialize()
    @balance = 0
    @current_journey = nil
    @list_of_journeys = []
  end

  def top_up(amount)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
    @balance = @balance + amount
  end

  def deduct(amount)
  	@balance -= amount
  end

  def in_journey?
    @current_journey != nil
  end

  def tap_in(entry_station)
    raise "Not enough funds" if @balance < 1
    tap_out(nil) if in_journey?
    @current_journey = Journey.new(entry_station, nil)
  end

  def tap_out(exit_station)
    @current_journey = Journey.new(nil, exit_station) if !in_journey?
    @current_journey.exit_station = exit_station
    deduct(@current_journey.fare)
    @list_of_journeys << @current_journey
    @current_journey = nil
  end

  def entry_station
    @current_journey.entry_station
  end
end

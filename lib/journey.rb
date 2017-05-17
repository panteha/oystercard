class Journey
  attr_reader :start_station, :end_station

  MINIMUM_COST = 2
  PENALTY = 6

  def initialize(start_station)
    @start_station = start_station
    @end_station = nil
  end

  def finish(end_station)
    @end_station = end_station
  end

  def calculate_cost
    return PENALTY unless complete?
    return MINIMUM_COST if complete?
    0
  end

  def complete?
    @start_station && @end_station
  end

end

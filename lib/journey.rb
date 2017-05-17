class Journey
  attr_reader :start_station, :end_station

  MINIMUM_COST = 4
  PENALTY = 8

  def initialize(start_station)
    @start_station = start_station
    @end_station = nil
  end

  def finish(end_station)
    @end_station = end_station
  end

  def calculate_cost
    return PENALTY if incomplete?
    MINIMUM_COST
  end

  def incomplete?
    @start_station && !@end_station
  end


end

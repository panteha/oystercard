class Journey
  PENALTY_FARE = 6
  MINIMUM_FARE = 1

attr_reader :entry_station
attr_accessor :exit_station

  def initialize(entry_station, exit_station)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def incomplete?
    !@entry_station || !@exit_station
  end

  def fare
    if incomplete?
      PENALTY_FARE
    else
      MINIMUM_FARE
    end
  end
  # def entry_station
  #
  # end
  #
  # def exit_station
  #
  # end

end

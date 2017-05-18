class JourneyLog

  def initialize(journey_class)
    @journey_class = journey_class
    @journeys = []
    @incomplete_journey = nil
  end

  def start(entry_station)
    @incomplete_journey = @journey_class.new(entry_station, nil)
  end

  def in_journey?
    return false if !@incomplete_journey
    current_journey.incomplete?
  end

  def finish(exit_station)
    current_journey.complete(exit_station)
    @journeys << current_journey
    current_journey
  end

  def journeys
    @journeys.dup
  end

  private

  def current_journey
    @incomplete_journey ||= Journey.new
  end

end

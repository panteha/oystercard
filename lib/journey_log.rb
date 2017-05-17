require_relative './journey.rb'

# JourneyLog class:
class JourneyLog
  def initialize(journey_class)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)
    @current_journey = @journey_class.new(entry_station)
  end

  def finish(exit_station)
    current_journey.finish(exit_station)
    @journeys << @current_journey
    @current_journey = nil
  end

  def journeys
    @journeys.dup
  end

  private

  def current_journey
    @current_journey ||= @journey_class.new
  end
end

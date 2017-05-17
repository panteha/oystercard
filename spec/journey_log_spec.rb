require_relative '../lib/journey_log.rb'

describe 'JourneyLog' do

  let(:journey) { double(:journey) }
  let(:journey_class) { double(:journey_class, new: journey) }
  let(:journey_log) { JourneyLog.new(journey_class) }

  it 'is expected to respond to #start' do
    expect(subject).to respond_to(:start)
  end

  it 'can use its journey_class parameter to instantiate a journey class object' do
    expect(journey_log.journey_class).to respond_to(:new)
  end
  
end

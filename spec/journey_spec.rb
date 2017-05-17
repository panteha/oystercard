require_relative '../lib/journey.rb'

describe 'Journey' do
  let(:entry_station) { double(:station)}
  let(:exit_station) { double(:station)}
  let(:journey) { Journey.new(entry_station) }

  it "receive the start station when we instantiate" do
    expect(journey.start_station).to eq entry_station
  end

  it "receive the exit station at the end of the journey" do
    journey.finish(exit_station)
    expect(journey.end_station).to eq exit_station
  end

  it "calculate the cost of the journey" do
    journey.finish(exit_station)
    expect(journey.calculate_cost).to eq Journey::MINIMUM_COST
  end

  it "calculate the penalty if the journey is not finished" do
    expect(journey.calculate_cost).to eq Journey::PENALTY
  end

end

require 'journey'

describe Journey do
  let(:station1){double :station}
  let(:station2){double :station}

  # made a complete journey
  let(:subject){Journey.new(station1, station2)}

  let(:no_tap_out_journey){Journey.new(:station1, nil)}
  let(:no_tap_in_journey){Journey.new(nil, :station2)}

  it {is_expected.to respond_to :entry_station}
  it {is_expected.to respond_to :exit_station}

  it "returns the start station of the journey" do
    expect(subject.entry_station). to eq station1
  end

  it "returns the end station of the journey" do
    expect(subject.exit_station).to eq station2
  end

  it "is complete if there is a entry and exit station" do
    expect(subject.incomplete?).to eq false
  end

  it "is incomplete if there is no entry station" do
    expect(no_tap_in_journey.incomplete?).to eq true
  end

  it "is incomplete if there is no exit station" do
    expect(no_tap_out_journey.incomplete?).to eq true
  end

  it "has a penalty fare if tap in and do not tap out" do
    expect(no_tap_in_journey.fare).to eq Journey::PENALTY_FARE
  end

  it "has a penalty fare if tap out and do not tap in" do
    expect(no_tap_out_journey.fare).to eq Journey::PENALTY_FARE
  end

  it "has a minimum fare if tap out and tap in" do
    expect(subject.fare).to eq Journey::MINIMUM_FARE
  end
end

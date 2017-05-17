require 'station'

describe Station do
  let(:subject){Station.new(:Aldgate, 1)}

  it "responds to having a name" do
    expect(subject).to respond_to :name
  end

  it "responds to having a zone" do
    expect(subject).to respond_to :zone
  end

  it "returns the name of station" do
    expect(subject.name).to eq :Aldgate
  end

  it "returns the zone of the station" do
    expect(subject.zone).to eq 1
  end

end

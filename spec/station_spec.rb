require_relative '../lib/station.rb'

describe Station do
  test_station_name = :Euston
  test_station_zone = 1
  let(:station) { Station.new(test_station_name, test_station_zone) }

  it 'has a name' do
    expect(station.name).to eq test_station_name
  end

  it 'has a zone' do
    expect(station.zone).to eq test_station_zone
  end

end
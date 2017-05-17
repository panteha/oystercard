require_relative '../lib/oystercard'

describe Oystercard do

  it { is_expected.to respond_to(:top_up).with(1).argument }
  it { is_expected.to respond_to(:deduct).with(1).argument }
  it { is_expected.to respond_to(:tap_out).with(1).argument }
  let(:station) { double :station }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:first_journey) { double :journey, finish: true, calculate_cost: 1 }
  let(:second_journey) { double :journey, finish: true, calculate_cost: 1 }

  it 'instance has default balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it 'can top up the balance' do
    expect { subject.top_up(1) }.to change { subject.balance }.by(1)
  end

  it 'raises an error if the maximum balance is exceeded' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up maximum_balance
    expect { subject.top_up 1 }.to raise_error 'Maximum balance exceeded!'
  end

  it 'can deduct from balance' do
    expect { subject.deduct 1 }.to change { subject.balance }.by(-1)
  end

  it 'knows it has been tapped in' do
    subject.balance = 5
    subject.tap_in(station)
    expect(subject.in_journey?).to eq true
  end

  it 'card knows when not in use' do
    expect(subject.in_journey?).to eq false
  end

  it 'knows it has been tapped out' do
    expect(subject.in_journey?).to eq false
  end

  it 'Raise tap in error if there is less than one pound' do
    subject.balance = 0.5
    expect { subject.tap_in(station) }.to raise_error 'Not enough funds'
  end

  it 'has empty list of journey by default' do
    expect(subject.list_of_journeys).to be_empty
  end

  it 'adds completed journeys to it\'s list of journeys' do
    subject.instance_variable_set('@journey', first_journey)
    subject.tap_out(exit_station)
    subject.instance_variable_set('@journey', second_journey)
    subject.tap_out(exit_station)
    expect(subject.list_of_journeys). to eq [first_journey, second_journey]
  end

end

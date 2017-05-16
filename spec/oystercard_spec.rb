require 'oystercard'

describe Oystercard do
	it { is_expected.to respond_to(:top_up).with(1).argument }
	it { is_expected.to respond_to(:deduct).with(1).argument }

	it "instance has default value of 0" do
		expect(subject.balance).to eq(0)
	end

	it "can top up the balance" do
		expect{ subject.top_up 1}.to change{subject.balance}.by 1
	end

	it 'raises an error if the maximum balance is exceeded' do
  	maximum_balance = Oystercard::MAXIMUM_BALANCE
  	subject.top_up maximum_balance
  	expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
	end

	it 'can deduct from balance' do
	expect{ subject.deduct 1}.to change{subject.balance}.by -1
	end

	it "knows it has been tapped in" do
		subject.balance = 5
		expect(subject.tap_in).to eq true
	end

	it "card knows when not in use" do
		expect(subject.in_journey?).to eq false
	end

	it "knows it has been tapped out" do
		expect(subject.tap_out).to eq false
	end

	it "Raise tap in error if there is less than one pound" do
		#subject.balance = 0.5
		expect{ subject.tap_in }.to raise_error "Not enough funds"
	end

end

require 'oystercard'

describe Oystercard do
	it { is_expected.to respond_to(:top_up).with(1).argument }

	it "instance has default value of 0" do
		expect(subject.balance).to eq(0)
	end
end

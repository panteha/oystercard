require 'oystercard'

describe Oystercard do
	it { is_expected.to respond_to(:top_up).with(1).argument }

	it "instance has default value of 0" do
		expect(subject.balance).to eq(0)
	end

	it "can top up the balance" do
		expect{ subject.top_up 1}.to change{subject.balance}.by 1
	end
	it "Raises an exception if balance exceeds £90" do
		maximum_balance = Oystercard::MAXIMUM_BALANCE
	 	subject.top_up(maximum_balance)
			expect { subject.top_up 1}.to raise_error "Balance exceeds £90"
	end

end

require 'oystercard'

	describe Oystercard do
		it {is_expected.to respond_to(:balance)}

	before :each do
		@oystercard = Oystercard.new balance = 0
	end
	describe '#new' do
		it "instance has default value of 0" do
			@oystercard.balance.should eql 0
		end
	end
end

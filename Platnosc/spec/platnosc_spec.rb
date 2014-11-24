require 'simplecov'
SimpleCov.start

require_relative '../lib/platnosc'

describe Paypal do
	it "Should be empty" do
		expect {
			Paypal.new()
		}.to_not raise_error
	end
	
	it "Should have empty array" do
		expect(Paypal.new()).to eq([])
	end
	
	describe "#valuessetup" do
		let(:ary) { ary = [1,2,3] }

		it "Sets values" do
			expect(Paypal.new().valuessetup(ary)).to eq([10, "PLN", "USD"])
		end

		it "has the length of the array given" do
			expect {
				ary = [10, "PLN", "USD"]
				leng = ary.length
				Paypal.valuessetup(ary).lenght.to eq(leng)
			}
		end
	
	
		describe "#checkifpossibletoexchange" do
			let(:can) {Paypal.new().valuessetup([10, "PLN", "USD"]).checkifpossibletoexchange)}
			let(:cannot) {Paypal.new().valuessetup([10, "PLN", "RUB"]).checkifpossibletoexchange)}
		it "returns true if there is such value in program" do
			expect(can.checkifpossibletoexchange).to eq(true)
		end
		it "returns false if there isn't such value in program" do
			expect(cannot.checkifpossibletoexchange).to eq(false)
		end
		
	
	
	
	
end

require 'simplecov'
require 'rspec/mocks/standalone'
require_relative '../lib/OurTab.rb'
require_relative '../lib/Qsort.rb'

SimpleCov.start

describe Qsort do
	let(:cla){Class.new {include Qsort}}

	describe "#deletethat" do
		it "Should deleted given number from array" do
			expect(OurTab.new().setS([5,6,7,8]).deletethat(6)).to eq([5,7,8])
		end
	end

	describe "#increaseit" do
		let(:increase) { OurTab.new().setS([5,6,7,8]).increaseit(2)} 
		
		it "Should increase whole array by number given" do
			expect(increase).to eq([7,8,9,10])
		end
		
	end
	describe "#decreaseit" do
	let(:decrease) { OurTab.new().setS([5,6,7,8]).decreaseit(2)} 
	it "Should decrease the whole array by number given" do
			expect(decrease).to eq([3,4,5,6])
		end
	end	

	describe "#quicksort" do
	let(:magic) { OurTab.new().setS([10,2,1,5]).quicksort(self, 10, 5)}
		it "Should put numbers in increasing order" do
			expect(magic).to eq(nil)
		end
	end
end

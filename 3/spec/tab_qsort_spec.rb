require 'simplecov'
require 'rspec/mocks/standalone'
require_relative '../lib/OurTab.rb'
require_relative '../lib/Qsort.rb'

SimpleCov.start

describe Qsort do
	let(:cla){Class.new {include Qsort}}

	describe "Qsort" do 
		before do
			Qsort.stub!(:print)
			Qsort.stub!(:puts)
		end
		it "should do something" do
			Something.dosomethingfunny
		end
	end
	

end
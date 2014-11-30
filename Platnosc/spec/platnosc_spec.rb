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
                let(:ary) { ary = [10, "PLN", "USD"] }
 
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
        end
       
                describe "#checkifpossibletoexchange" do
                        let(:can) {Paypal.new().valuessetup([10, "PLN", "USD"])}
                        let(:cannot) {Paypal.new().valuessetup([10, "PLN", "RUB"])}
                        let(:cannotfirst) {Paypal.new().valuessetup([10, "RUB", "PLN"])}
                it "returns true if there is such value in program" do
                        expect(can.checkifpossibletoexchange).to eq(false)
                end
                it "returns false if there isn't such to exchange value in program" do
                        expect(cannot.checkifpossibletoexchange).to eq(false)
                end
                it "returns false if there isn't such from exchange value in program" do
                        expect(cannot.checkifpossibletoexchange).to eq(false)
                end
end
               
                describe "#exchange" do
                let (:ten) {Paypal.new().valuessetup([10, "PLN", "USD"]).exchange(0.287966)}
                let (:bad) {Paypal.new().valuessetup([10, "PLN", "USD"]).exchange(0.287966)}
               
                it "The value is goodly multiplied" do
                        expect(ten).to eq(2.88)
                end
                it "The value is goodly multiplied" do
                	expect(bad).to eq(2.88)
                        end
                end
               
               
                        describe "#international" do
                        let (:ten) {Paypal.new().valuessetup([10, "PLN", "USD"]).international}
                        let (:twenty) {Paypal.new().valuessetup([20, "PLN", "USD"]).international}
               
                        it "International is counted goodly" do
                                expect(ten).to eq(1.75)
                        end
                        it "International is counted goodly" do
                                expect(twenty).to eq(2.1500000000000004)
                        end
                        end
               
                        describe "#international" do
                        let (:tenc) {Paypal.new().valuessetup([10, "PLN", "USD"]).country}
                        let (:twentyc) {Paypal.new().valuessetup([20, "PLN", "USD"]).country}
               
                        it "Country is counted goodly" do
                                expect(tenc).to eq(1.00)
                        end
                        it "Country is counted goodly" do
                                expect(twentyc).to eq(1.2000000000000002)
                        end
                        end
            
                   
                   
                    end



require "spec_Helper"
require "coins/tax_calculations"


describe Class.new do
  
  include Coins::TaxCalculations
  
    describe "tax_it" do
    
      test_data= [
        {:input => 100, :output => "116.00"},
        {:input => 200, :output => "232.00"},
        {:input => 80.50, :output => 93.38},
        {:input => 90.15, :output => 104.57},
        {:input => 10.33, :output => 11.98}
      ]
      test_data.each do |num|
        it "given #{num[:input]} returns #{num[:output]}" do
         taxed = tax_it(num[:input])
         expect(taxed).to eq(num[:output].to_s)
        end
      end
    end
  
    describe Coins::TaxCalculations::Taxable do
      before(:each) do
        @taxable = Coins::TaxCalculations::Taxable.new(100.00)
      end
    
      it "calculates the tax correctly" do
        @taxable.calculate_tax
        expect(@taxable.taxed).to eq(116)
      end
    
      it "tax == 16" do
        expect(@taxable.tax).to eq(16)
      end
    
      it "number == 100" do
        expect(@taxable.number).to eq(100.00)
      end
    
    end
  
end
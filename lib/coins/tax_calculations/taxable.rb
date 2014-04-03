module Coins
  module TaxCalculations
    class Taxable
      #
      # It does the basic Math for taxing a price
      #
      attr_accessor :number, :tax, :taxed
    
      def initialize(number)
        @number = number.to_f
        @tax = Coins.configuration.tax_rate
      end

      def calculate_tax
        taxed = (number * (tax * 0.01))+ number
        @taxed = taxed.round(2)
      end
    end
  end
end
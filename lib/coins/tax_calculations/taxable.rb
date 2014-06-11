module Coins
  module TaxCalculations
    class Taxable
      #
      # It does the basic Math for taxing a price
      #
      attr_accessor :number, :taxed
      attr_reader :tax_amount , :tax
    
      def initialize(number)

        @number = number.to_f
        #@tax = Coins.configuration.tax_rate
      end

      def calculate_tax
        applied_tax = (number * (tax * 0.01))
        taxed = applied_tax + number
        @tax_amount = applied_tax.round(2)
        @taxed = taxed.round(2)
      end

      def tax
        @tax ||= get_tax
      end

      def get_tax
        rate = GetTax.new
        rate.get_tax
      end
    end
  end
end
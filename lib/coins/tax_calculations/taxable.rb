module Coins
  module TaxCalculations
    class Taxable
      #
      # It does the basic Math for taxing a price
      #
      attr_accessor :number, :taxed
    
      def initialize(number)
        @number = number.to_f
        #@tax = Coins.configuration.tax_rate
      end

      def calculate_tax
        debugger
        taxed = (number * (tax * 0.01))+ number
        @taxed = taxed.round(2)
      end

      def tax
        @tax ||= get_tax
      end

      def get_tax
        if Coins.configuration.source == :database
          if Coins.configuration.eval_source
            check = eval(Coins.configuration.eval_source) rescue nil
            if check
              check
            else
              Coins.configuration.tax_rate
            end
          end
        end
      end
    end
  end
end
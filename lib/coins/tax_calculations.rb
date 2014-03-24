module Coins
  require 'active_support/concern'
  module TaxCalculations
    include ::ActionView::Helpers::NumberHelper
    extend ActiveSupport::Concern
    
      def tax_it(price)
        number = Taxable.new(price, get_tax)
        number.calculate_tax
        number_with_precision(number.taxed, :precision => 2)
      end    
      
      def get_tax
        begin
          parameter = 21
        rescue
          parameter = nil
        end

        if parameter and parameter != 0
          parameter
        else
          21
        end
      end
  
      class Taxable
        attr_accessor :number, :tax, :taxed
        
        def initialize(number, tax)
          @number = number.to_f
          @tax = tax
        end
  
        def calculate_tax
          taxed = (number * (tax * 0.01))+ number
          @taxed = taxed.round(2)
        end
      end
  end
end

require 'active_support/concern'
require "action_view"

module Coins
  
  module TaxCalculations

    include ::ActionView::Helpers::NumberHelper
    extend ActiveSupport::Concern
    
    def tax_it(price)
      number = Taxable.new(price)
      number.calculate_tax
      number_with_precision(number.taxed, :precision => 2)
    end

    def tax_it_extended(price)
    	number = Taxable.new(price)
      number.calculate_tax
      number
    end
  end

end
require "coins/tax_calculations/taxable"
require "coins/tax_calculations/get_tax"
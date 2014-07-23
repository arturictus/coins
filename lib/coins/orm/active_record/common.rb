module Coins
  module ActiveRecord
  	class Common

  		attr_reader :column
  		def initialize(column)
  			@column = column.to_s
  		end

  		def executable
			<<-RUBY
				include Coins::TaxCalculations

				def price_with_tax
					return unless price_in_euros
					tax_it(price_in_euros)
				end

				def tax_amount
					return unless price_in_euros
					tax_amount =  tax_it_extended(price_in_euros).tax_amount
					number_with_precision(tax_amount, precision: 2)
				end
			RUBY
  		end
  	end
  end
end
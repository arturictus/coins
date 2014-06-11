module Coins
  module ActiveRecord
  	class IntegerCoins < Common

  		attr_reader :column
  		def initialize(column)
  			@column = column.to_s
  		end

  		def executable
  			super.executable +
			<<-RUBY
				def price_in_euros=(euros)
					self.#{column} = euros.to_d*100 if euros.present?
				end

				def price_in_euros
					#{column}.to_d/100 if #{column}
				end
			RUBY
  		end
  	end
  end
end
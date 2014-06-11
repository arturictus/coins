module Coins
  module ActiveRecord
  	class Float < Common
  		def executable
  			super.executable +
			<<-RUBY
				def price_in_euros
					#{column}
				end
			RUBY
  		end
  	end
  end
end
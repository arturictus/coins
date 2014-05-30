module Coins
  	module TaxCalculations
	  	class GetTax
	  		attr_reader :tax_rate

	  		def initialize
	  			@tax_rate = Coins.configuration.tax_rate
	  		end


	  		def get_tax
		        if proc?
		          	check_proc
		        elsif integer?
		          	tax_rate
		        else
		        	raise ArgumentError
		        end
		    end

		    private

		    def proc?
		    	tax_rate.is_a?(Proc)
		    end

		    def integer?
		    	tax_rate.is_a?(Integer)
		    end

		    def check_proc
		    	if proc = execute_proc
		    		if proc.is_a?(Integer)
		    			proc
		    		else
		    			raise ArgumentError
		    			nil
		    		end
		        end
		    end

		    def execute_proc
		    	begin
		    		tax_rate.call
		    	rescue Exception => e
		    		#logger.warning e.to_s
		    		nil
		    	end
		    end
	  	end
  	end
end
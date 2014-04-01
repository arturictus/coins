# encoding: utf-8

require 'active_record'

module Coins
  module ActiveRecord
    # example:
    # class Post < ActiveRecord::Base
    #   have_coins :price_in_cents
    # end
    #
    # Now you have the methods:
    #  price_in_euros and price_with_tax
    #
    def have_coins(column)
      column = column.to_s
      class_eval <<-RUBY
        include Coins::TaxCalculations
        
         def price_in_euros=(euros)
            self.#{column} = euros.to_d*100 if euros.present?
         end
    
         def price_in_euros
            #{column}.to_d/100 if #{column}
         end
    
         def price_with_tax
           return unless price_in_euros
           tax_it(price_in_euros)
         end
      RUBY

    end

  end # ActiveRecord
end # Coins

ActiveRecord::Base.extend Coins::ActiveRecord
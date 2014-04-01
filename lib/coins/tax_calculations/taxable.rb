module Coins
  class Taxable
    #
    # It does the basic Math for taxing a price
    #
    attr_accessor :number, :tax, :taxed
    
    def initialize(number)
      @number = number.to_f
      @tax = Coins.tax
    end

    def calculate_tax
      taxed = (number * (tax * 0.01))+ number
      @taxed = taxed.round(2)
    end
  end
end
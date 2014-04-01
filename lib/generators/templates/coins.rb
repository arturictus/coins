# setup here Coins
Coins.setup do |config|
  
  # =>  Tax Rate 
  # integer
  #
  # that helps to have all the tax calculations in 1 place
  #
  # =>  database example
  ## if model Options exist
  # config.tax_rate = ::Options.find_by(:key => "tax_rate")
  ## I recommend to force a valid result like this:
  # from_options = ::Options.find_by(:key => "tax_rate")
  # config.tax_rate = from_options ? from_options.to_i : 12
  
  config.tax_rate = 12
  
end
Coins.configure do |config|
  
  # setup here Coins
  
  # =>  Tax Rate 
  # integer
  #
  # that helps to have all the tax calculations in 1 place
  config.tax_rate = 12
  
  
  # =>  database example
  # Set database as source
  ## config.source = :database
  # put the string that should have to be evaluated
  # example: for Model: Number
  ## config.eval_source = "Number.first.number"
  config.source = false
  config.eval_source = false
  
end
require 'active_support/core_ext/module/attribute_accessors'
module Coins
	class Configuration

		mattr_accessor :tax_rate
  		@@tax_rate = 1

  		mattr_accessor :source
  		@@source = nil

  		mattr_accessor :eval_source
  		@@eval_source = nil
	end
end
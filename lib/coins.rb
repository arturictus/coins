require "coins/version"
require 'active_support/core_ext/module/attribute_accessors'

module Coins
  autoload "coins/tax_calculations"
  
  mattr_accessor :tax_rate
  @@tax_rate = 0
  
  # Default way to setup Devise. Run rails generate coins_install to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end
  
end

if defined?(Rails)

  module Coins
    class Railtie < Rails::Railtie

      initializer "coins.active_record" do
        ActiveSupport.on_load :active_record do
          require 'coins/orm/activerecord'
        end
      end

    end
  end
end

require "coins/tax_calculations"
require "coins/version"
require "coins/configuration"


module Coins
  
  # Default way to setup Coins. Run rails generate coins_install to create
  # a fresh initializer with all configuration values.
  
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
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
require "coins/tax_calculations/taxable"

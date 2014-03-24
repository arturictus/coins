require "coins/version"

module Coins
  
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
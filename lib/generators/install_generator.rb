require 'rails/generators/base'

module Coins
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../templates", __FILE__)

    desc "Creates a Coins initializer."
    
    def copy_initializer
      template "coins.rb", "config/initializers/coins.rb"
    end
    
  end
end
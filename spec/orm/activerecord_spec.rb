# encoding: utf-8

require 'spec_helper'
require 'support/activerecord'


class TestMigration < ActiveRecord::Migration
  def self.up
    create_table :events, :force => true do |t|
      t.column :price_in_cents, :integer
      t.column :textfile, :string
      t.column :foo, :string
    end
  end

  def self.down
    drop_table :events
  end
end

class Event < ActiveRecord::Base; end # setup a basic AR class for testing
$arclass = 0

describe Coins::ActiveRecord do

  describe '#have_coins' do

    before(:all) { TestMigration.up }
    after(:all) { TestMigration.down }
    after { Event.delete_all }

    before do
      # Rails 4 defaults to no root in JSON, join the party
      ActiveRecord::Base.include_root_in_json = false

      # My god, what a horrible, horrible solution, but AR validations don't work
      # unless the class has a name. This is the best I could come up with :S
      $arclass += 1
      @class = Class.new(Event)
      # AR validations don't work unless the class has a name, and
      # anonymous classes can be named by assigning them to a constant
      Object.const_set("Event#{$arclass}", @class)
      @class.table_name = "events"
     # @uploader = Class.new(Coins::Uploader::Base)
      @class.have_coins(:price_in_cents)
      @event = @class.new
    end

    it "has method price_in_euros" do
      respond = @class.respond_to?(:price_in_euros)
      respond.should be(true)
    end
    it "has method price_with_tax" do
      respond = @class.respond_to?(:price_with_tax)
      respond.should be(true)
    end
    
  
  end
end
    

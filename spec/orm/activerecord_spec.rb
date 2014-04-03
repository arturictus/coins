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

class Event < ActiveRecord::Base
  have_coins(:price_in_cents)
end # setup a basic AR class for testing


describe Coins::ActiveRecord do

  describe '#have_coins' do

    before(:all) { TestMigration.up }
    after(:all) { TestMigration.down }
    after { Event.delete_all }

    before(:each) do
      ActiveRecord::Base.include_root_in_json = false
      @event = Event.create!(:price_in_cents => 10000)
    end

    it "has method price_in_euros" do
      respond = @event.respond_to?(:price_in_euros)
      respond.should be(true)
    end
    it "has method price_with_tax" do
      respond = @event.respond_to?(:price_with_tax)
      respond.should be(true)
    end
    
    it "calculates euros" do
      euros = @event.price_in_euros
      expect(euros).to eq(100)
    end
  
    it "price get taxed" do
      taxed = @event.price_with_tax
      expect(taxed).to eq("116.00")
    end
      
  end
end
    

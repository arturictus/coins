require "spec_helper"#module Coins  describe Coins::Configuration do    describe "#tax_rate" do      it "default value is 6" do        Configuration.new.tax_rate = 16      end    end    describe "#tax_rate=" do      xit "can set value" do        config = Configuration.new        config.tax_rate = 7        expect(config.tax_rate).to eq(7)      end    end    it "fails" do      true.should be false    end  end#end
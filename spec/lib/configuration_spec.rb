require "spec_helper"

module Coins
  describe Configuration do
    describe "#tax_rate" do
      it "default value is 6" do
        Configuration.new.tax_rate = 16
      end
    end

    describe "#tax_rate=" do
      it "can set value" do
        config = Configuration.new
        config.tax_rate = 7
        expect(config.tax_rate).to eq(7)
      end
    end
  end
end
require 'rails_helper'

RSpec.describe Category, type: :model do
  context "Testing factory" do
    it "should be valid" do
      expect(build(:category)).to be_valid
    end
  end

  context "Testing name" do
    it "should be invalid if empty" do
      expect(build(:category, name:'')).to be_invalid
    end
  end
end

require 'rails_helper'

RSpec.describe Category, type: :model do
  context "Testing factory" do
    it "should be valid" do
      expect(build(:category)).to be_valid
    end
  end
end

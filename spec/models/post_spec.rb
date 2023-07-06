require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user, email:'teste@teste', password:'123@46', name:'teste') }
  context "Testing factory" do
    it "should be valid" do
      expect(build(:post, user:user)).to be_valid
    end
  end
end

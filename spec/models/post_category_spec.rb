require 'rails_helper'

RSpec.describe PostCategory, type: :model do
  let(:category) { create(:category) }
  let(:post) { create(:post) }
  
  context 'Testing factory' do
    it 'should be valid' do
      expect(build(:post_category, category_id: category.id, post_id: post.id)).to be_valid
    end
  end

  context 'Testing category' do
    it 'should be invalid if nil' do
      expect(build(:post_category, category: nil, post_id: post.id)).to be_invalid
    end

    it 'should be invalid if id does not exists' do
      expect(build(:post_category, category_id: -1, post_id: post.id)).to be_invalid
    end
  end
end

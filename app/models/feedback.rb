class Feedback < ApplicationRecord
  validates :like, presence: :true, inclusion: [true, false], exclusion: [nil]

  belongs_to :post
  belongs_to :user
end

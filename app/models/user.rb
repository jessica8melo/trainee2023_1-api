class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_initialize :set_defaults
  validates :name, presence: :true
  
  has_many :posts
  has_many :commentaries
  has_many :feedbacks
  
  private
  def set_defaults
    is_admin = false
  end
end

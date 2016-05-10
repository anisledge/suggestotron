class Topic < ActiveRecord::Base
  has_many :votes, dependent: :destroy
  has_many :downvotes, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
end  

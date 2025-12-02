class Task < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  
  enum status: { pending: 0, in_progress: 1, completed: 2 }
  
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 1000 }
end

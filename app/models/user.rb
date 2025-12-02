class User < ApplicationRecord
  has_secure_password
  
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_tasks, through: :favorites, source: :task
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end

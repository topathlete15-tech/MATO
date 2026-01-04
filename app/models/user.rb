class User < ApplicationRecord
  has_secure_password
  
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_tasks, through: :favorites, source: :task
  has_many :comment_favorites, dependent: :destroy
  has_many :favorite_comments, through: :comment_favorites, source: :comment

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :user_name, presence: true, uniqueness: true
end


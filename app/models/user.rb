class User < ApplicationRecord
  # Associations
  has_many :posts, foreign_key: 'author_id', class_name: 'Post', dependent: :destroy
  has_many :comments, foreign_key: 'user_id', class_name: 'Comment', dependent: :destroy
  has_many :likes, foreign_key: 'user_id', class_name: 'Like', dependent: :destroy

  # Attributes
  attribute :name, :string
  attribute :photo, :string
  attribute :bio, :text
  attribute :posts_counter, :integer, default: 0

  # Methods
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end

class Comment < ApplicationRecord
  # Associations
  belongs_to :users, foreign_key: 'user_id', class_name: 'User'
  belongs_to :posts, foreign_key: 'post_id', class_name: 'Post'
end

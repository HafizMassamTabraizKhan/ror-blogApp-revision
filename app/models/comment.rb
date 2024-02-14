class Comment < ApplicationRecord
  # Associations
  belongs_to :users, foreign_key: 'user_id', class_name: 'User'
  belongs_to :posts, foreign_key: 'post_id', class_name: 'Post'

  # Callback
  after_save :increment_comments_counter_for_post
  after_destroy :decrement_comments_counter_for_post

  # Methods
  def increment_comments_counter_for_post
    post.increment!(:comments_counter)
  end

  def decrement_comments_counter_for_post
    post.decrement!(:comments_counter)
  end
end

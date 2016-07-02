class Comment < ApplicationRecord
  belongs_to :user
  has_one    :parent,   -> { where("parent_id > 0") }, class_name: 'Comment',foreign_key: :parent_id
  has_many   :replies,  class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
  has_many :votes , class_name: 'CommentVote'

  validates :content,   presence: true
end

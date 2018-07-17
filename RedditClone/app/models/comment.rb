class Comment < ApplicationRecord
  validates :content, :author_id, :post_id, presence: true
  
  has_many :comments,
    foreign_key: :parent_comment_id,
    class_name: :Comment
    
  belongs_to :author
  
  belongs_to :post
  
end

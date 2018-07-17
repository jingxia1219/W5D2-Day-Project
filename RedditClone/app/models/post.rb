class Post < ApplicationRecord
  validates :title, :post_subs, :author_id, presence: true
  
  belongs_to :author, 
    foreign_key: :author_id,
    class_name: :User
    
  has_many :post_subs
  
  has_many :subs,
   through: :post_subs
end

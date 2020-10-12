class Comment < ApplicationRecord
  #belongs_to :article
  
  has_many :subcomments, class_name: "Comment", as: :commentable, dependent: :destroy
  belongs_to :commentable, polymorphic: true
  belongs_to :user
end

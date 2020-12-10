class Comment < ApplicationRecord
  belongs_to :post
  
  validates_presence_of :body, on: :create
end

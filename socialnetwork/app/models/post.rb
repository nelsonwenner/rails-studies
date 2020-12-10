class Post < ApplicationRecord
  belongs_to :profile
  
  validates_presence_of :title, :body, on: :create
end

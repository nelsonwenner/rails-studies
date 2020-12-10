class Post < ApplicationRecord
  belongs_to :profile
  has_many :comment, dependent: :destroy
  
  validates_presence_of :title, :body, on: :create
end

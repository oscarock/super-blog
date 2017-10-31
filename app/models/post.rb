class Post < ApplicationRecord
	validates :title, presence: true		
	validates :body, presence: true, length: { minimum: 250 }		
  belongs_to :user
  has_many :comment
end

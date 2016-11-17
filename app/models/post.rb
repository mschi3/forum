class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, ->{ order("id DESC") }
	has_many :post_categories
  has_many :categories, through: :post_categories
end

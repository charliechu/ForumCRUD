class Post < ActiveRecord::Base
  belongs_to :user
	belongs_to :board
	has_many :category_post_relation
	has_many :categories, :through => :category_post_relation
end

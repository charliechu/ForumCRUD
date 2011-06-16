class Post < ActiveRecord::Base
	belongs_to :board
	has_many :category_post_relation
	has_many :category, :through => :category_post_relation
end

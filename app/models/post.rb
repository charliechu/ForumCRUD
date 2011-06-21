class Post < ActiveRecord::Base
  belongs_to :user
	belongs_to :board, :counter_cache => true
	has_many :category_post_relation
	has_many :categories, :through => :category_post_relation
end

class Category < ActiveRecord::Base
  has_many :category_post_relation
  has_many :posts, :through => :category_post_relation
end

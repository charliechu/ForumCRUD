class Post < ActiveRecord::Base
  belongs_to :user
	belongs_to :board, :counter_cache => true
	has_many :category_post_relation
	has_many :categories, :through => :category_post_relation
	
	#params[:recent] should be recent scope , recent scope should be "updated_at DESC"
  scope :recent, order("updated_at DESC")
  scope :newest, order("id DESC")
end

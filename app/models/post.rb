class Post < ActiveRecord::Base
  belongs_to :user
	belongs_to :board, :counter_cache => true
	has_many :category_post_relation
	has_many :categories, :through => :category_post_relation
	#attactment photo file
	has_attached_file :photo, :styles => {:medium => "300x300>", :thumb => "100x100>"}

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  
	#params[:recent] should be recent scope , recent scope should be "updated_at DESC"
  scope :recent, order("updated_at DESC")
  scope :newest, order("id DESC")
end

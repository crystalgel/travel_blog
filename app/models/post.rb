class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy

	validates :title, presence: true, length: {minimum: 5}
	validates :body, presence: true

  	mount_uploader :avatar, AvatarUploader
	mount_uploaders :avatars, AvatarUploader


  	belongs_to :post
end

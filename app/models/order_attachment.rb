class OrderAttachment < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	belongs_to :order

	validates_presence_of :avatar
end

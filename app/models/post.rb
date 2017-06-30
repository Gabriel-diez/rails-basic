class Post < ApplicationRecord

  mount_uploader :picture, AvatarUploader
  belongs_to :user
end

class Post < ApplicationRecord

  mount_uploader :picture, AvatarUploader
end

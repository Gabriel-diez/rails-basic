# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  picture    :string
#  user_id    :integer
#

class Post < ApplicationRecord

  mount_uploader :picture, AvatarUploader
  belongs_to :user
end

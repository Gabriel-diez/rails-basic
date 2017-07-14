# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  firstname              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  lastname               :string
#  age                    :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  avatar                 :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :firstname, :lastname, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates_format_of :email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

  has_many :posts
  has_many :comments

  def to_s
    [firstname, lastname].join(' ')
  end
end

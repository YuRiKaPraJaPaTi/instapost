class Post < ApplicationRecord
  has_one_attached :photo

  belongs_to :user

  validates :photo, :description, presence: true

  has_many :comments, dependent: :destroy

  acts_as_votable

  delegate :email, to: :user, prefix: true

  # def user_email
  #   user.email
  # end
end
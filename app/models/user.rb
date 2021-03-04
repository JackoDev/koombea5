class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :socials, inverse_of: :user
  has_one_attached :user_image

  validates :user_image, content_type: { with: ["image/png", "image/jpg"], message: "Only .jpg and .png files are allowed!" }
  validates :username, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                  uniqueness: { case_sensitive: false },
                  length: { maximum: 105 },
                  format: { with: VALID_EMAIL_REGEX }

  accepts_nested_attributes_for :socials, allow_destroy: true, reject_if: :all_blank

  def thumbnail
    if user_image.attached?
      user_image.variant(resize: '100x100')
    end
  end

  def profile_img
    if user_image.attached?
      user_image.variant(resize: '400x400')
    end
  end

end

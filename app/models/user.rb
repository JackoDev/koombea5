class User < ApplicationRecord
    has_one_attached :profile_image, :dependent => :destroy
    has_many :socials, inverse_of: :user
    accepts_nested_attributes_for :socials, allow_destroy: true, reject_if: :all_blank
    validates :username, presence: true,
                        uniqueness: { case_sensitive: false },
                        length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
end

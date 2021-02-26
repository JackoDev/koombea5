class User < ApplicationRecord
    has_many :socials, inverse_of: :user
    has_one_attached :user_image
    accepts_nested_attributes_for :socials, allow_destroy: true, reject_if: :all_blank
    validates :username, presence: true,
                        uniqueness: { case_sensitive: false },
                        length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }

    def thumbnail
        if user_image.attached?
            user_image.variant(combine_options: { resize: '600x600', gravity: 'center' })
        end
    end
end

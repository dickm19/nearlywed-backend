class User < ApplicationRecord
    has_secure_password
    has_one :wedding, foreign_key: "user_id", dependent: :destroy
    has_one_attached :avatar

    validates :email, presence: true
    validates :email, uniqueness: { case_sensitive: false }
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    after_create :create_wedding_for_nearlywed

    private

    def create_wedding_for_nearlywed
        wedding = Wedding.create(user: self)
        self.update(wedding_id: wedding.id)
    end
end

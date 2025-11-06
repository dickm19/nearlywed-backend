class Guest < ApplicationRecord
    belongs_to :wedding

    validates :email, uniqueness: { case_sensitive: false }, if: :email_present?
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, if: :email_present?
    validates_presence_of :first_name
    validates_presence_of :phone_number

    private

    def email_present?
      email.present?
    end   
end

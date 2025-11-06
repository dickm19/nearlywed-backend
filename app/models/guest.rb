class Guest < ApplicationRecord
    belongs_to :wedding

    validates :email, uniqueness: { case_sensitive: false }
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates_presence_of :first_name
    validates_presence_of :phone_number
end

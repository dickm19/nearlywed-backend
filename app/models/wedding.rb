class Wedding < ApplicationRecord
    belongs_to :user
    has_many :venues, dependent: :destroy

    has_one :registry, dependent: :destroy
end

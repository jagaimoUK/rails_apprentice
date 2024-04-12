class Tag < ApplicationRecord
    has_many :tag_relationships, dependent: :destroy
    validates :name, presence: true, uniqueness: true
end

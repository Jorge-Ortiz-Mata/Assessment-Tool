class Framework < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true

    has_rich_text :description
    has_many :criteria, dependent: :destroy

    after_create_commit {broadcast_prepend_to "frameworks"}
end

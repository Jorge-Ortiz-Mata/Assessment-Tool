class Framework < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true

    has_rich_text :description
    has_many :criteria, dependent: :destroy

    has_many :template_frameworks, dependent: :destroy
    has_many :templates, through: :template_frameworks, dependent: :destroy

    after_create_commit {broadcast_prepend_to "frameworks"}
end

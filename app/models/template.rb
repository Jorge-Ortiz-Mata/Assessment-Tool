class Template < ApplicationRecord

    validates :name, presence: true
    validates :description, presence: true

    has_rich_text :description

    has_many :template_frameworks, dependent: :destroy
    has_many :frameworks, through: :template_frameworks, dependent: :destroy
end

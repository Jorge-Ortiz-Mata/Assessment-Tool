class Template < ApplicationRecord

    validates :name, presence: true
    validates :description, presence: true

    has_rich_text :description

    has_many :template_frameworks, dependent: :destroy
    has_many :frameworks, through: :template_frameworks, dependent: :destroy

    after_create_commit { broadcast_append_to(
            'templates_channel', 
            target: 'templates_table',
            partial: "templates/template_row",
            locals: { template: self }
        ) }
  
end

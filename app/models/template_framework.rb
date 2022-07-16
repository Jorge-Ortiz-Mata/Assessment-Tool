class TemplateFramework < ApplicationRecord
  belongs_to :template
  belongs_to :framework

  validates :order, presence: true
end

class Criterium < ApplicationRecord
  enum answer_type: %i[text_box multiple_choice check_box scale]

  validates :text, presence: true
  validates :answer_type, presence: true, inclusion: { in: answer_types.keys }

  belongs_to :framework
end

class CreateCriteria < ActiveRecord::Migration[7.0]
  def change
    create_table :criteria do |t|
      t.string :text
      t.integer :answer_type
      t.references :framework, null: false, foreign_key: true

      t.timestamps
    end
  end
end

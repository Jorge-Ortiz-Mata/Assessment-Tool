class CreateTemplateFrameworks < ActiveRecord::Migration[7.0]
  def change
    create_table :template_frameworks do |t|
      t.references :template, null: false, foreign_key: true
      t.references :framework, null: false, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end

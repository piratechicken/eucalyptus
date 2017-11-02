class CreateSpecies < ActiveRecord::Migration[5.1]
  def change
    create_table :species do |t|
      t.string :name
      t.string :common_name
      t.references :growth_form, foreign_key: true
      t.text :description
      t.text :image_data

      t.timestamps
    end
  end
end

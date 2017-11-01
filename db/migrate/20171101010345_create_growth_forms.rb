class CreateGrowthForms < ActiveRecord::Migration[5.1]
  def change
    create_table :growth_forms do |t|
      t.string :name
      t.text :description
      t.text :image_data

      t.timestamps
    end
  end
end

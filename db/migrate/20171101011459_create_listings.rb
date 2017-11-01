class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.references :species, foreign_key: true
      t.references :user, foreign_key: true
      t.text :description
      t.integer :price_cents
      t.text :image_data

      t.timestamps
    end
  end
end

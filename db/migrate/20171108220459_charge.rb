class Charge < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true
      t.string :charge_identifier

      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.text :note
      t.float :typical_quantity
      t.string :typical_measure

      t.timestamps
    end
  end
end

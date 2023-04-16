class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.references :user, null: false, foreign_key: true
      t.text :note, null: true
      t.float :typical_quantity, null: false, default: 1
      t.string :typical_measure, null: false, defualt: ""

      t.timestamps
    end
  end
end

class CreateBaskets < ActiveRecord::Migration[7.0]
  def change
    create_table :baskets do |t|
      t.string :name, null: false, default: "My Basket"
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

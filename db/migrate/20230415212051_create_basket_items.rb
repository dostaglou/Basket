class CreateBasketItems < ActiveRecord::Migration[7.0]
  def change
    create_table :basket_items do |t|
      t.references :basket, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.string :name, null: false
      t.string :note, null: true
      t.float :quantity, null: false, default: 1
      t.string :measure, null: false, default: ""
      t.string :status, null: false, default: BasketItem::Statuses::PENDING

      t.timestamps
    end
  end
end

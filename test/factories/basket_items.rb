# == Schema Information
#
# Table name: basket_items
#
#  id         :bigint           not null, primary key
#  measure    :string           default(""), not null
#  name       :string           not null
#  note       :string
#  quantity   :float            default(1.0), not null
#  status     :string           default("pending"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  basket_id  :bigint           not null
#  item_id    :bigint           not null
#
# Indexes
#
#  index_basket_items_on_basket_id  (basket_id)
#  index_basket_items_on_item_id    (item_id)
#
# Foreign Keys
#
#  fk_rails_...  (basket_id => baskets.id)
#  fk_rails_...  (item_id => items.id)
#
FactoryBot.define do
  factory :basket_item do
    basket { nil }
    item { nil }
    name { "MyString" }
    note { "MyString" }
    quantity { 1.5 }
    measure { "MyString" }
  end
end

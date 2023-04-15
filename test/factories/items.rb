# == Schema Information
#
# Table name: items
#
#  id               :bigint           not null, primary key
#  name             :string           not null
#  note             :text
#  typical_measure  :string           not null
#  typical_quantity :float            default(1.0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_items_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :item do
    name { "MyString" }
    user { nil }
    note { "MyText" }
    typical_quantity { 1.5 }
    typical_measure { "MyString" }
  end
end

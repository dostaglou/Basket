FactoryBot.define do
  factory :item do
    name { "MyString" }
    user { nil }
    note { "MyText" }
    typical_quantity { 1.5 }
    typical_measure { "MyString" }
  end
end

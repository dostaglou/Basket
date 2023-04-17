# == Schema Information
#
# Table name: baskets
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_baskets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Basket < ApplicationRecord
  belongs_to :user
  has_many :basket_items, dependent: :destroy

  def image_name
    "shopping-venture"
  end
end

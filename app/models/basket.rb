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
  # after_commit -> (basket) { broadcast_replace_to basket }
  after_update -> (basket) { basket.broadcast_replace_to basket }
  after_destroy -> (basket) { basket.broadcast_remove_to basket }


  accepts_nested_attributes_for :basket_items

  def image_name
    "shopping-venture"
  end
end

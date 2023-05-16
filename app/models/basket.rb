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
  after_commit -> (basket) { broadcast_replace_to basket }

  def send_it
    self.broadcast_replace_later_to self, target: "basket_#{self.id}"
  end
  def image_name
    "shopping-venture"
  end
end

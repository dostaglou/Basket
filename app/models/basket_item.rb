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
class BasketItem < ApplicationRecord
  belongs_to :basket
  belongs_to :item

  module Statuses
    PENDING = 'pending'
    PICKED_UP = 'picked_up'
  end

  class << self
    def get_statuses
      Statuses.constants(false).map { |c| Statuses.const_get(c) }
    end
  end

  validates :status, inclusion: { in: self.get_statuses }

  def image_name
    "shopping-venture"
  end

  def pending?
    self.status == Statuses::PENDING
  end
end

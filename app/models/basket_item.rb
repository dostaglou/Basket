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
#
# Indexes
#
#  index_basket_items_on_basket_id  (basket_id)
#
# Foreign Keys
#
#  fk_rails_...  (basket_id => baskets.id)
#
class BasketItem < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :name_note_search,
                  against: %i(name note),
                  using: {
                    tsearch: {
                      prefix: true,
                    }
                  }

  belongs_to :basket

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
  validates :name, uniqueness: { scope: :basket_id }
  after_validation -> (item) { name.strip! }


  def image_name
    "shopping-venture.png"
  end

  def qty_measure_to_words
    if measure.present?
      "#{self.quantity} x #{self.measure}"
    else
      "#{self.quantity}"
    end
  end

  def pending?
    self.status == Statuses::PENDING
  end

  def toggled_status
    if self.pending?
     Statuses::PICKED_UP
    else
      Statuses::PENDING
    end
  end
end

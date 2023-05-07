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
require "test_helper"

class BasketItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

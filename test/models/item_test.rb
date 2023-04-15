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
require "test_helper"

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

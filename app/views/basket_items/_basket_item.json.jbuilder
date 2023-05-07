json.extract! basket_item, :id, :basket_id, :name, :note, :quantity, :measure, :created_at, :updated_at
json.url basket_item_url(basket_item, format: :json)

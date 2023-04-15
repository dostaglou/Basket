json.extract! item, :id, :name, :user_id, :note, :typical_quantity, :typical_measure, :created_at, :updated_at
json.url item_url(item, format: :json)

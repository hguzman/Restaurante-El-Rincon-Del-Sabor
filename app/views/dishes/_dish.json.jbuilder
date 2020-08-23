json.extract! dish, :id, :nombre, :precio, :existencia, :descripcion, :category_id, :created_at, :updated_at
json.url dish_url(dish, format: :json)

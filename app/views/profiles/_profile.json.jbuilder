json.extract! profile, :nombre, :foto, :cedula, :telefono, :created_at, :updated_at
json.url profile_url(product, format: :json)

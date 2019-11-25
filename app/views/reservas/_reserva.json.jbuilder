json.extract! reserva, :id, :user_id, :livro_id, :retirado, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)

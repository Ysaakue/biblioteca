json.extract! livro, :id, :titulo, :publicacao, :editora_id, :exemplar, :created_at, :updated_at
json.url livro_url(livro, format: :json)

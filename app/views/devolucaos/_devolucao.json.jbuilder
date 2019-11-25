json.extract! devolucao, :id, :aluno_id, :bibliotecario_id, :multa, :created_at, :updated_at
json.url devolucao_url(devolucao, format: :json)

class Editora < ApplicationRecord
  belongs_to :estado
  belongs_to :cidade
  has_many :livros

  def self.qnt_por_estado
    connection.select_all "select editoras.estado_id,count(editoras.id) from editoras group by editoras.estado_id;"
  end

  def self.qnt_livro_por_editora
    connection.select_all "select editoras.id, count(livros.id) as qnt_livros from editoras left join livros on livros.editora_id = editoras.id group by editoras.id;"
  end
  
end

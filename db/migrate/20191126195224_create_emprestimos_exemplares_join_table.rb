class CreateEmprestimosExemplaresJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :emprestimos_exemplares, id: false do |t|
      t.integer :emprestimo_id
      t.integer :exemplar_id
    end
  end
end

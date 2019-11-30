# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20191130195859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assuntos", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "autores", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cidades", force: :cascade do |t|
    t.string "nome"
    t.bigint "estado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estado_id"], name: "index_cidades_on_estado_id"
  end

  create_table "devolucoes", force: :cascade do |t|
    t.bigint "aluno_id"
    t.bigint "bibliotecario_id"
    t.float "multa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "emprestimo_id"
    t.index ["aluno_id"], name: "index_devolucoes_on_aluno_id"
    t.index ["bibliotecario_id"], name: "index_devolucoes_on_bibliotecario_id"
  end

  create_table "editoras", force: :cascade do |t|
    t.string "nome"
    t.bigint "estado_id"
    t.bigint "cidade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cidade_id"], name: "index_editoras_on_cidade_id"
    t.index ["estado_id"], name: "index_editoras_on_estado_id"
  end

  create_table "emprestimos", force: :cascade do |t|
    t.bigint "aluno_id"
    t.bigint "bibliotecario_id"
    t.datetime "data_prev_ret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_emprestimos_on_aluno_id"
    t.index ["bibliotecario_id"], name: "index_emprestimos_on_bibliotecario_id"
  end

  create_table "emprestimos_exemplares", id: false, force: :cascade do |t|
    t.integer "emprestimo_id"
    t.integer "exemplar_id"
  end

  create_table "estados", force: :cascade do |t|
    t.string "nome"
    t.string "uf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exemplares", force: :cascade do |t|
    t.bigint "livro_id"
    t.datetime "aquisicao"
    t.string "situacao"
    t.boolean "em_emprestimo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["livro_id"], name: "index_exemplares_on_livro_id"
  end

  create_table "livros", force: :cascade do |t|
    t.string "titulo"
    t.datetime "publicacao"
    t.bigint "editora_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "exemplar_id"
    t.integer "assunto_id"
    t.index ["editora_id"], name: "index_livros_on_editora_id"
  end

  create_table "livros_autores", id: false, force: :cascade do |t|
    t.integer "livros_id"
    t.integer "autor_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "nome"
    t.string "subject_class"
    t.string "action"
    t.string "controller_namespace"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions_roles", force: :cascade do |t|
    t.bigint "permission_id"
    t.bigint "role_id"
    t.index ["permission_id"], name: "index_permissions_roles_on_permission_id"
    t.index ["role_id"], name: "index_permissions_roles_on_role_id"
  end

  create_table "reservas", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "livro_id"
    t.boolean "retirado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["livro_id"], name: "index_reservas_on_livro_id"
    t.index ["user_id"], name: "index_reservas_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "nome"
    t.boolean "uo_dependent", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "uos", force: :cascade do |t|
    t.string "nome"
    t.string "sigla"
    t.string "cnpj"
    t.string "endereco"
    t.string "complemento"
    t.string "bairro"
    t.bigint "estado_id"
    t.bigint "cidade_id"
    t.string "cep"
    t.string "codigo_ug"
    t.integer "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cidade_id"], name: "index_uos_on_cidade_id"
    t.index ["estado_id"], name: "index_uos_on_estado_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.bigint "uo_id"
    t.string "username"
    t.boolean "ad_user", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["uo_id"], name: "index_users_on_uo_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "cidades", "estados"
  add_foreign_key "devolucoes", "users", column: "aluno_id"
  add_foreign_key "devolucoes", "users", column: "bibliotecario_id"
  add_foreign_key "editoras", "cidades"
  add_foreign_key "editoras", "estados"
  add_foreign_key "emprestimos", "users", column: "aluno_id"
  add_foreign_key "emprestimos", "users", column: "bibliotecario_id"
  add_foreign_key "exemplares", "livros"
  add_foreign_key "livros", "editoras"
  add_foreign_key "permissions_roles", "permissions"
  add_foreign_key "permissions_roles", "roles"
  add_foreign_key "reservas", "livros"
  add_foreign_key "reservas", "users"
  add_foreign_key "uos", "cidades"
  add_foreign_key "uos", "estados"
  add_foreign_key "users", "roles"
  add_foreign_key "users", "uos"
end

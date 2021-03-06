# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_02_221630) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "cartografias", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "questao"
    t.string "resumo"
    t.string "fonte"
    t.string "local"
    t.text "referencias"
    t.date "data"
    t.text "descricao"
    t.string "temas"
    t.text "observacoes"
    t.text "citacoes"
    t.string "responsavel"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "relatorios", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "ano"
    t.integer "semestre"
    t.jsonb "documento_data"
    t.uuid "tecitura_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tecitura_id"], name: "index_relatorios_on_tecitura_id"
  end

  create_table "tecituras", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "endereco"
    t.string "latitude"
    t.string "longitude"
    t.integer "vinc_ano"
    t.integer "vinc_semestre"
    t.text "situacao_atual"
    t.text "nucleo_familiar"
    t.text "regiao"
    t.text "situacao_acolhimento"
    t.text "ref_atencao_primaria"
    t.text "ref_assistencia_social"
    t.text "vinc_familiares_comunitarios"
    t.text "situacao_juridica"
    t.string "equipe_tecitura"
    t.string "ref_padhu"
    t.string "responsaveis"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "permissions", array: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["permissions"], name: "index_users_on_permissions", using: :gin
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "relatorios", "tecituras"
end

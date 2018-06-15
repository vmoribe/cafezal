# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20180614234511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analises", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "fazenda_id"
    t.integer  "talhao_id"
    t.string   "situacao"
    t.string   "profundidade"
    t.integer  "ano"
    t.decimal  "ph",            precision: 10, scale: 2
    t.decimal  "potassio_k",    precision: 10, scale: 2
    t.decimal  "fosforo_p",     precision: 10, scale: 2
    t.decimal  "sodio_na",      precision: 10, scale: 2
    t.decimal  "calcio_ca",     precision: 10, scale: 2
    t.decimal  "magnesio_mg",   precision: 10, scale: 2
    t.decimal  "aluminio_al",   precision: 10, scale: 2
    t.decimal  "h_al",          precision: 10, scale: 2
    t.decimal  "mat_organica",  precision: 10, scale: 2
    t.decimal  "p_rem",         precision: 10, scale: 2
    t.decimal  "zinco_zn",      precision: 10, scale: 2
    t.decimal  "ferro_fe",      precision: 10, scale: 2
    t.decimal  "manganes_mn",   precision: 10, scale: 2
    t.decimal  "cobre_cu",      precision: 10, scale: 2
    t.decimal  "boro_b",        precision: 10, scale: 2
    t.decimal  "enxofre_s",     precision: 10, scale: 2
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.decimal  "prodEsperada",  precision: 10, scale: 2
    t.string   "safra"
    t.decimal  "litrosScMedia", precision: 10, scale: 2
    t.decimal  "scHaMedia",     precision: 10, scale: 2
  end

  add_index "analises", ["fazenda_id"], name: "index_analises_on_fazenda_id", using: :btree
  add_index "analises", ["talhao_id"], name: "index_analises_on_talhao_id", using: :btree
  add_index "analises", ["user_id"], name: "index_analises_on_user_id", using: :btree

  create_table "fazendas", force: :cascade do |t|
    t.string   "nome"
    t.text     "descricao"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "fazendas", ["user_id"], name: "index_fazendas_on_user_id", using: :btree

  create_table "lotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "fazenda_id"
    t.integer  "talhao_id"
    t.string   "tipo"
    t.string   "local"
    t.integer  "numero"
    t.integer  "numeroOrigem"
    t.date     "dataEntrada"
    t.decimal  "quantidade",   precision: 10, scale: 2
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "safra"
  end

  add_index "lotes", ["fazenda_id"], name: "index_lotes_on_fazenda_id", using: :btree
  add_index "lotes", ["talhao_id"], name: "index_lotes_on_talhao_id", using: :btree
  add_index "lotes", ["user_id"], name: "index_lotes_on_user_id", using: :btree

  create_table "parametros", force: :cascade do |t|
    t.integer  "ano"
    t.integer  "parcelamento"
    t.string   "producao_esperada"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
    t.string   "metodo"
  end

  create_table "produtos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "nome"
    t.string   "tipo"
    t.decimal  "preco",        precision: 10, scale: 2
    t.decimal  "custo_op",     precision: 10, scale: 2
    t.decimal  "nitrogenio_n", precision: 10, scale: 2
    t.decimal  "fosforo_p2o5", precision: 10, scale: 2
    t.decimal  "potassio_k2o", precision: 10, scale: 2
    t.decimal  "calcio_ca",    precision: 10, scale: 2
    t.decimal  "magnesio_mg",  precision: 10, scale: 2
    t.decimal  "enxofre_s",    precision: 10, scale: 2
    t.decimal  "boro_b",       precision: 10, scale: 2
    t.decimal  "cobre_cu",     precision: 10, scale: 2
    t.decimal  "ferro_fe",     precision: 10, scale: 2
    t.decimal  "manganes_mn",  precision: 10, scale: 2
    t.decimal  "zinco_zn",     precision: 10, scale: 2
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "ano"
    t.decimal  "cao",          precision: 10, scale: 2
    t.decimal  "mgo",          precision: 10, scale: 2
    t.decimal  "prnt",         precision: 10, scale: 2
  end

  add_index "produtos", ["user_id"], name: "index_produtos_on_user_id", using: :btree

  create_table "talhaos", force: :cascade do |t|
    t.integer  "fazenda_id"
    t.string   "nome"
    t.string   "cultura"
    t.string   "variedade"
    t.integer  "ano_plantio"
    t.decimal  "area",        precision: 10, scale: 2
    t.decimal  "esp_ruas",    precision: 10, scale: 2
    t.decimal  "esp_plantas", precision: 10, scale: 2
    t.integer  "argila"
    t.integer  "silte"
    t.integer  "areia"
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "talhaos", ["fazenda_id"], name: "index_talhaos_on_fazenda_id", using: :btree
  add_index "talhaos", ["user_id"], name: "index_talhaos_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vargessos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ano"
    t.decimal  "profundidade",  precision: 10, scale: 2
    t.decimal  "areaAplicacao", precision: 10, scale: 2
    t.decimal  "teorCalcio",    precision: 10, scale: 2
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "vargessos", ["user_id"], name: "index_vargessos_on_user_id", using: :btree

  create_table "variavels", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ano"
    t.decimal  "profundidade",  precision: 10, scale: 2
    t.decimal  "areaAplicacao", precision: 10, scale: 2
    t.decimal  "prnt",          precision: 10, scale: 2
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "produto_id"
    t.string   "metodo"
  end

  add_index "variavels", ["produto_id"], name: "index_variavels_on_produto_id", using: :btree
  add_index "variavels", ["user_id"], name: "index_variavels_on_user_id", using: :btree

  add_foreign_key "analises", "fazendas"
  add_foreign_key "analises", "talhaos"
  add_foreign_key "analises", "users"
  add_foreign_key "fazendas", "users"
  add_foreign_key "lotes", "fazendas"
  add_foreign_key "lotes", "talhaos"
  add_foreign_key "lotes", "users"
  add_foreign_key "produtos", "users"
  add_foreign_key "talhaos", "fazendas"
  add_foreign_key "talhaos", "users"
  add_foreign_key "vargessos", "users"
  add_foreign_key "variavels", "produtos"
  add_foreign_key "variavels", "users"
end

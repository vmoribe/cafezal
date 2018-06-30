class CreateLotes < ActiveRecord::Migration
  def change
    create_table :lotes do |t|
      t.references :user, index: true
      t.references :fazenda, index: true
      t.references :talhao, index: true
      t.string :tipo
      t.string :local
      t.integer :numero
      t.integer :numero_origem
      t.date :data_entrada
      t.decimal :quantidade, precision: 10, scale: 2

      t.timestamps null: false
    end
    add_foreign_key :lotes, :users
    add_foreign_key :lotes, :fazendas
    add_foreign_key :lotes, :talhaos
  end
end

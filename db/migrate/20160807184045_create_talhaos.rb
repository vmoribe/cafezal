class CreateTalhaos < ActiveRecord::Migration
  def change
    create_table :talhaos do |t|
      t.references :fazenda, index: true
      t.string :nome
      t.string :cultura
      t.string :variedade
      t.integer :ano_plantio
      t.decimal :area, precision: 10, scale: 2
      t.decimal :esp_ruas, precision: 10, scale: 2
      t.decimal :esp_plantas, precision: 10, scale: 2
      t.integer :argila
      t.integer :silte
      t.integer :areia
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :talhaos, :fazendas
    add_foreign_key :talhaos, :users
  end
end

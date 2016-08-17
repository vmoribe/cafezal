class CreateAnalises < ActiveRecord::Migration
  def change
    create_table :analises do |t|
      t.references :user, index: true
      t.references :fazenda, index: true
      t.references :talhao, index: true
      t.string :situacao
      t.string :profundidade
      t.integer :ano
      t.decimal :ph, precision: 10, scale: 2
      t.decimal :potassio_k, precision: 10, scale: 2
      t.decimal :fosforo_p, precision: 10, scale: 2
      t.decimal :sodio_na, precision: 10, scale: 2
      t.decimal :calcio_ca, precision: 10, scale: 2
      t.decimal :magnesio_mg, precision: 10, scale: 2
      t.decimal :aluminio_al, precision: 10, scale: 2
      t.decimal :h_al, precision: 10, scale: 2
      t.decimal :mat_organica, precision: 10, scale: 2
      t.decimal :p_rem, precision: 10, scale: 2
      t.decimal :zinco_zn, precision: 10, scale: 2
      t.decimal :ferro_fe, precision: 10, scale: 2
      t.decimal :manganes_mn, precision: 10, scale: 2
      t.decimal :cobre_cu, precision: 10, scale: 2
      t.decimal :boro_b, precision: 10, scale: 2
      t.decimal :enxofre_s, precision: 10, scale: 2

      t.timestamps null: false
    end
    add_foreign_key :analises, :users
    add_foreign_key :analises, :fazendas
    add_foreign_key :analises, :talhaos
  end
end

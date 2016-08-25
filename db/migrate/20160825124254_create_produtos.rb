class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.references :user, index: true
      t.string :nome
      t.string :tipo
      t.decimal :preco, precision: 10, scale: 2
      t.decimal :custo_op, precision: 10, scale: 2
      t.decimal :nitrogenio_n, precision: 10, scale: 2
      t.decimal :fosforo_p2o5, precision: 10, scale: 2
      t.decimal :potassio_k2o, precision: 10, scale: 2
      t.decimal :calcio_ca, precision: 10, scale: 2
      t.decimal :magnesio_mg, precision: 10, scale: 2
      t.decimal :enxofre_s, precision: 10, scale: 2
      t.decimal :boro_b, precision: 10, scale: 2
      t.decimal :cobre_cu, precision: 10, scale: 2
      t.decimal :ferro_fe, precision: 10, scale: 2
      t.decimal :manganes_mn, precision: 10, scale: 2
      t.decimal :zinco_zn, precision: 10, scale: 2

      t.timestamps null: false
    end
    add_foreign_key :produtos, :users
  end
end

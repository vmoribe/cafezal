class AddProdEsperadaToAnalises < ActiveRecord::Migration
  def change
    add_column :analises, :prodEsperada, :decimal, precision: 10, scale: 2
  end
end

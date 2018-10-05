class AddColumnsToAnalise1 < ActiveRecord::Migration
  def change
    add_column :analises, :objetivok, :decimal, precision: 10, scale: 2
    add_column :analises, :k2orecomend, :decimal, precision: 10, scale: 2
    add_column :analises, :nrecomend, :decimal, precision: 10, scale: 2
    add_column :analises, :p2o5recomend, :decimal, precision: 10, scale: 2
    add_column :analises, :objetivop, :decimal, precision: 10, scale: 2
  end
end

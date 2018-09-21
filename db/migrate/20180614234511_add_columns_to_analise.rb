class AddColumnsToAnalise < ActiveRecord::Migration
  def change
    add_column :analises, :safra, :string
    add_column :analises, :litrosScMedia, :decimal, precision: 10, scale: 2
    add_column :analises, :scHaMedia, :decimal, precision: 10, scale: 2
    add_reference :analises, :produto, index: true
    add_foreign_key :analises, :produtos
    add_column :analises, :aprovcalcario, :decimal, precision: 10, scale: 2
    add_column :analises, :objetivoca, :decimal, precision: 10, scale: 2
    add_column :analises, :kgharecomend, :decimal, precision: 10, scale: 2
  end
end

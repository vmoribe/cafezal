class AddColumnsToAnalise < ActiveRecord::Migration
  def change
    add_column :analises, :safra, :string
    add_column :analises, :litrosScMedia, :decimal, precision: 10, scale: 2
    add_column :analises, :scHaMedia, :decimal, precision: 10, scale: 2
  end
end

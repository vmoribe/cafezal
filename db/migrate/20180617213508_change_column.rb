class ChangeColumndata_entrada < ActiveRecord::Migration
  def change
    rename_column :lotes, :dataEntrada, :data_entrada
  end
end

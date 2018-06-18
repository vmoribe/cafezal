class ChangeColumndata_entrada < ActiveRecord::Migration
  def up
    rename_column :lotes, :dataEntrada, :data_entrada
  end

  def down
    rename_column :lotes, :data_entrada, :dataEntrada
  end
  
  # def change
  #   rename_column :lotes, :dataEntrada, :data_entrada
  # end
end

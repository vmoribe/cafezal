class ChangeColumn < ActiveRecord::Migration
  def change
    rename_column :lotes, :dataEntrada, :data_entrada
  end
end

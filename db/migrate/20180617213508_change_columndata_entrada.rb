class ChangeColumndata_entrada < ActiveRecord::Migration
  def change
    rename_column :lotes, :data_entrada, :data_entrada
  end
end

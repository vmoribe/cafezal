class RemovePrntFromVariavels < ActiveRecord::Migration
  def change
    remove_column :variavels, :prnt, :decimal, precision: 10, scale: 2
  end
end

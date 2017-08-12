class AddColumnsToProduto < ActiveRecord::Migration
  def change
    add_column :produtos, :cao, :decimal, precision: 10, scale: 2
    add_column :produtos, :mgo, :decimal, precision: 10, scale: 2
    add_column :produtos, :prnt, :decimal, precision: 10, scale: 2
  end
end

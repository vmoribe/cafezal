class AddAnoToProdutos < ActiveRecord::Migration
  def change
    add_column :produtos, :ano, :integer
  end
end

class AddProdutoToVariavel < ActiveRecord::Migration
  def change
    add_reference :variavels, :produto, index: true
    add_foreign_key :variavels, :produtos
  end
end

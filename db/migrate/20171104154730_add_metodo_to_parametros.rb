class AddMetodoToParametros < ActiveRecord::Migration
  def change
    add_column :parametros, :metodo, :string
  end
end

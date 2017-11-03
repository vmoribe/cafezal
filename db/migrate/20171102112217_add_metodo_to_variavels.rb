class AddMetodoToVariavels < ActiveRecord::Migration
  def change
    add_column :variavels, :metodo, :string
  end
end

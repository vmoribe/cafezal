class AddSafraToLotes < ActiveRecord::Migration
  def change
    add_column :lotes, :safra, :string
  end
end

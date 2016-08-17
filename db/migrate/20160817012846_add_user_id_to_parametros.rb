class AddUserIdToParametros < ActiveRecord::Migration
  def change
    add_column :parametros, :user_id, :integer
  end
end

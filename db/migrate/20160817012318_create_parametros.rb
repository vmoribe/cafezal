class CreateParametros < ActiveRecord::Migration
  def change
    create_table :parametros do |t|
      t.integer :ano
      t.integer :parcelamento
      t.string :producao_esperada

      t.timestamps null: false
    end
  end
end

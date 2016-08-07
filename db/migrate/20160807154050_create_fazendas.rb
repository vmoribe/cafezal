class CreateFazendas < ActiveRecord::Migration
  def change
    create_table :fazendas do |t|
      t.string :nome
      t.text :descricao
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :fazendas, :users
  end
end

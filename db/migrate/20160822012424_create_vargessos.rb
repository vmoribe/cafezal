class CreateVargessos < ActiveRecord::Migration
  def change
    create_table :vargessos do |t|
      t.references :user, index: true
      t.integer :ano
      t.decimal :profundidade, precision: 10, scale: 2
      t.decimal :areaAplicacao, precision: 10, scale: 2
      t.decimal :teorCalcio, precision: 10, scale: 2

      t.timestamps null: false
    end
    add_foreign_key :vargessos, :users
  end
end

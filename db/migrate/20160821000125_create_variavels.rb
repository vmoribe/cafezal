class CreateVariavels < ActiveRecord::Migration
  def change
    create_table :variavels do |t|
      t.references :user, index: true
      t.integer :ano
      t.decimal :profundidade, precision: 10, scale: 2
      t.decimal :areaAplicacao, precision: 10, scale: 2
      t.decimal :prnt, precision: 10, scale: 2

      t.timestamps null: false
    end
    add_foreign_key :variavels, :users
  end
end

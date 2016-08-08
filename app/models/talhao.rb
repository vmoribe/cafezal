class Talhao < ActiveRecord::Base
  belongs_to :fazenda
  belongs_to :user

  validates_presence_of :fazenda_id, :nome, :cultura, :variedade, :ano_plantio, :area, :esp_ruas, :esp_plantas#, :argila, :silte, :areia


  def qtde_plantas
    ((10000/esp_ruas)/esp_plantas)*area
  end
end

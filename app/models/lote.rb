class Lote < ActiveRecord::Base
  belongs_to :user
  belongs_to :fazenda
  belongs_to :talhao

  validates_presence_of :user_id, :fazenda_id, :talhao_id, :tipo, :local, :numero, :data_entrada, :quantidade, :safra
  def qtdeSacas
  	quantidade/480  	
  end
end

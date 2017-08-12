class Variavel < ActiveRecord::Base
  belongs_to :user
  belongs_to :produto
  validates_presence_of :ano, :profundidade, :areaAplicacao
end

class Variavel < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :ano, :profundidade, :areaAplicacao, :prnt
end

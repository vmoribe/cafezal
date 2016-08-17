class Parametro < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :ano, :parcelamento, :producao_esperada
end

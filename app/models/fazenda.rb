class Fazenda < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :nome, :descricao
end

class Fazenda < ActiveRecord::Base
  belongs_to :user
  has_many :talhaos
  validates_presence_of :nome, :descricao
end

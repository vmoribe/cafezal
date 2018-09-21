class Produto < ActiveRecord::Base
  belongs_to :user
  has_many :analises
  validates_presence_of :nome, :tipo, :preco, :custo_op
end

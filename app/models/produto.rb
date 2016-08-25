class Produto < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :nome, :tipo, :preco, :custo_op
end

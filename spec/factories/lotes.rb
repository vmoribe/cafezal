FactoryGirl.define do
  factory :lote do
    user nil
    fazenda nil
    talhao nil
    tipo "MyString"
    local "MyString"
    numero 1
    numeroOrigem 1
    dataEntrada "2016-09-14"
    quantidade "9.99"
  end
end

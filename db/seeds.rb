# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

#User.create!([
#  {email: "vmp@viniciusmoribe.com", encrypted_password: "$2a$11$rNmQLuEu5SnKafmaUYYsnO9htrxfaG0jcSnMNNz3YEmcHpZzrQGSG", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-08-07 15:51:24", last_sign_in_at: "2016-08-07 15:51:24", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", nome: nil, confirmation_token: nil, confirmed_at: "2016-08-07 15:41:38", confirmation_sent_at: nil, unconfirmed_email: nil, role: 2, invitation_token: nil, invitation_created_at: nil, invitation_sent_at: nil, invitation_accepted_at: nil, invitation_limit: nil, invited_by_id: nil, invited_by_type: nil, invitations_count: 0}
#])

Fazenda.create!([
  {nome: "Fazenda Agropecuária Frade", descricao: "Nazareno-MG", user_id: 1},
  {nome: "Fazenda Morro Redondo", descricao: "Nazareno-MG", user_id: 1},
  {nome: "Fazenda Arião", descricao: "Nazareno-MG", user_id: 1}
])
Talhao.create!([
  {fazenda_id: 1, nome: "L1 - F", cultura: "Café", variedade: "Catuai Vermelho", ano_plantio: 2005, area: "10.3", esp_ruas: "3.5", esp_plantas: "0.7", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 1, nome: "L2 - F", cultura: "Café", variedade: "Mundo Novo", ano_plantio: 2005, area: "2.92", esp_ruas: "3.5", esp_plantas: "0.7", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 1, nome: "L3 - F", cultura: "Café", variedade: "Mundo Novo", ano_plantio: 2006, area: "2.51", esp_ruas: "3.5", esp_plantas: "0.8", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 1, nome: "L4 - F", cultura: "Café", variedade: "Acaiá", ano_plantio: 2008, area: "2.72", esp_ruas: "3.5", esp_plantas: "0.7", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 1, nome: "L5 - F", cultura: "Café", variedade: "Mundo Novo", ano_plantio: 2010, area: "4.97", esp_ruas: "3.5", esp_plantas: "0.7", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 1, nome: "L6 - F", cultura: "Café", variedade: "Catucai Amarelo", ano_plantio: 2006, area: "3.83", esp_ruas: "3.5", esp_plantas: "0.8", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 1, nome: "L6A - F", cultura: "Café", variedade: "Catucai Amarelo", ano_plantio: 2006, area: "1.93", esp_ruas: "2.6", esp_plantas: "0.6", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 1, nome: "L7 - F", cultura: "Café", variedade: "Mundo Novo", ano_plantio: 2006, area: "7.8", esp_ruas: "3.7", esp_plantas: "0.7", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 1, nome: "L8 - F", cultura: "Café", variedade: "Catuai Vermelho", ano_plantio: 2008, area: "6.87", esp_ruas: "3.7", esp_plantas: "0.7", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 1, nome: "L9 - F", cultura: "Café", variedade: "Mundo Novo", ano_plantio: 2010, area: "11.9", esp_ruas: "3.5", esp_plantas: "0.7", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 1, nome: "L10 - F", cultura: "Café", variedade: "Catuai I-99", ano_plantio: 2015, area: "7.6", esp_ruas: "3.6", esp_plantas: "0.75", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 1, nome: "L11 - F", cultura: "Café", variedade: "Catuai I-99", ano_plantio: 2015, area: "10.4", esp_ruas: "3.6", esp_plantas: "0.75", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 2, nome: "L1 - M", cultura: "Café", variedade: "Catuai Vermelho", ano_plantio: 1998, area: "7.52", esp_ruas: "3.7", esp_plantas: "0.7", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 2, nome: "L2 - M", cultura: "Café", variedade: "Icatu", ano_plantio: 1998, area: "4.59", esp_ruas: "3.7", esp_plantas: "0.8", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 2, nome: "L3 - M", cultura: "Café", variedade: "Icatu", ano_plantio: 1997, area: "6.13", esp_ruas: "3.7", esp_plantas: "0.7", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 2, nome: "L4 - M", cultura: "Café", variedade: "Rubi", ano_plantio: 1999, area: "4.79", esp_ruas: "3.7", esp_plantas: "0.7", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 2, nome: "L5 - M", cultura: "Café", variedade: "Rubi", ano_plantio: 2000, area: "6.68", esp_ruas: "3.7", esp_plantas: "0.7", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 2, nome: "L6 - M", cultura: "Café", variedade: "Acaiá", ano_plantio: 1999, area: "11.9", esp_ruas: "3.7", esp_plantas: "0.7", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 2, nome: "L7 - M", cultura: "Café", variedade: "Acaiá", ano_plantio: 1999, area: "7.41", esp_ruas: "3.7", esp_plantas: "0.7", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 2, nome: "L8 - M", cultura: "Café", variedade: "Acaiá", ano_plantio: 2000, area: "3.97", esp_ruas: "3.7", esp_plantas: "0.7", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 2, nome: "L9 - M", cultura: "Café", variedade: "Catuai Vermelho", ano_plantio: 2001, area: "3.54", esp_ruas: "3.5", esp_plantas: "0.7", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 2, nome: "L10 - M", cultura: "Café", variedade: "Topázio", ano_plantio: 2013, area: "13.0", esp_ruas: "3.7", esp_plantas: "0.75", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 3, nome: "L1 - A", cultura: "Café", variedade: "Catucai", ano_plantio: 2014, area: "8.88", esp_ruas: "3.6", esp_plantas: "0.75", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 3, nome: "L2 - A", cultura: "Café", variedade: "Catuai", ano_plantio: 2014, area: "10.8", esp_ruas: "3.6", esp_plantas: "0.75", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 3, nome: "L3 - A", cultura: "Café", variedade: "Catuai", ano_plantio: 2014, area: "8.57", esp_ruas: "3.6", esp_plantas: "0.75", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 3, nome: "L4 - A", cultura: "Café", variedade: "Catuai", ano_plantio: 2015, area: "11.7", esp_ruas: "3.6", esp_plantas: "0.75", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 2, nome: "L11 - M", cultura: "Café", variedade: "Catuai", ano_plantio: 2015, area: "2.19", esp_ruas: "3.6", esp_plantas: "0.75", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 2, nome: "L12 - M", cultura: "Café", variedade: "Catuai", ano_plantio: 2010, area: "7.85", esp_ruas: "3.6", esp_plantas: "0.7", argila: 0, silte: 0, areia: 0, user_id: 1},
  {fazenda_id: 2, nome: "L13 - M", cultura: "Café", variedade: "Catucai", ano_plantio: 2015, area: "5.19", esp_ruas: "3.6", esp_plantas: "0.75", argila: 0, silte: 0, areia: 0, user_id: 1}
])

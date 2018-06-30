json.extract! lote, :id, :user_id, :fazenda_id, :talhao_id, :tipo, :local, :numero, :numero_origem, :data_entrada, :quantidade, :created_at, :updated_at
json.url lote_url(lote, format: :json)
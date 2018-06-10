class AnalisesController < ApplicationController
  before_action :set_analise, only: [:show, :edit, :update, :destroy]

  def relacoes
    @analises = Analise.where(user_id: current_user.id).order( "profundidade ASC", "talhao_id ASC")
    @fazendas = Fazenda.where(user_id: current_user.id).order("id ASC")
    @parametros = Parametro.where(user_id: current_user.id).order("id DESC")        
  end

  def fertilizantes
    @produtos = Produto.where(user_id: current_user.id).order("id ASC")
    @search = Analise.where(user_id: current_user.id).ransack(params[:q])
    @analises = @search.result
    @analises = @analises.where(:ano => nil) unless params[:q]
    @parametros = Parametro.where(user_id: current_user.id).order("id DESC")
    @plantio = @analises.where("situacao = ?", "Plantio").order("ano DESC", "talhao_id ASC")
    @primeiroAno = @analises.where("situacao = ?", "1° Ano").order("ano DESC", "talhao_id ASC")
    @segundoAno = @analises.where("situacao = ?", "2° Ano / Poda").order("ano DESC", "talhao_id ASC")
    @producao = @analises.where("situacao = ?", "Produção").order("ano DESC", "talhao_id ASC")
    @ano = Analise.order("ano Desc").uniq.pluck(:ano)
    @fazenda = Fazenda.uniq.pluck(:nome)

    respond_to do |format|
      format.html

      format.pdf { render pdf: "Análise Fertilizantes",
        content: render_to_string(template: 'analises/fertilizantes.html.erb'),
        orientation: 'Landscape',
        page_size: 'A4',
        zoom: 0.60
        }
    end

  end

  def micronutrientes
    @search = Analise.where(user_id: current_user.id).ransack(params[:q])
    @analises = @search.result
    @analises = @analises.where(:ano => nil) unless params[:q]
    @ano = Analise.order("ano Desc").uniq.pluck(:ano)
    @fazenda = Fazenda.uniq.pluck(:nome)

    respond_to do |format|
      format.html

      format.pdf { render pdf: "Micronutrientes",
        content: render_to_string(template: 'analises/micronutrientes.html.erb'),
        orientation: 'Landscape',
        page_size: 'A4',
        zoom: 0.60
        }
    end

  end
  
  def gessagem
    @search = Analise.where(user_id: current_user.id).ransack(params[:q])
    @analises = @search.result
    @analises = @analises.where(:ano => nil) unless params[:q]
    @vargessos = Vargesso.where(user_id: current_user.id).order("id DESC")
    @ano = Analise.order("ano Desc").uniq.pluck(:ano)
    @fazenda = Fazenda.uniq.pluck(:nome)

    respond_to do |format|
      format.html

      format.pdf { render pdf: "Gessagem",
        content: render_to_string(template: 'analises/gessagem.html.erb'),
        orientation: 'Landscape',
        page_size: 'A4',
        zoom: 0.60
        }
    end

  end

  def fertilidade
    @search = Analise.where(user_id: current_user.id).ransack(params[:q])
    @analises = @search.result
    @analises = @analises.order("ano ASC").where(:ano => nil) unless params[:q]
    @parametros = Parametro.where(user_id: current_user.id).order("id DESC")
    @plantio = @analises.where("situacao = ?", "Plantio").order("ano DESC", "talhao_id ASC")
    @primeiroAno = @analises.where("situacao = ?", "1° Ano").order("ano DESC", "talhao_id ASC")
    @segundoAno = @analises.where("situacao = ?", "2° Ano / Poda").order("ano DESC", "talhao_id ASC")
    @producao = @analises.where("situacao = ?", "Produção").order("ano DESC", "talhao_id ASC")
    @ano = Analise.order("ano Desc").uniq.pluck(:ano)
    @fazenda = Fazenda.uniq.pluck(:nome)



    respond_to do |format|
      format.html

      format.pdf { render pdf: "Necessidade NPK",
        content: render_to_string(template: 'analises/fertilidade.html.erb'),
        orientation: 'Landscape',
        zoom: 0.60
        }
    end

  end

  def calagem
    @search = Analise.where(user_id: current_user.id).ransack(params[:q])
    @analises = @search.result
    @analises = @analises.where(:ano => nil) unless params[:q]
    @plantio = @analises.where("situacao = ?", "Plantio").order("ano DESC")
    @correcao = @analises.where("situacao != ?", "Plantio").order("ano DESC")
    @variavels = Variavel.where(user_id: current_user.id).order("id DESC")
    @ano = Analise.order("ano Desc").uniq.pluck(:ano)
    @fazenda = Fazenda.uniq.pluck(:nome)

    respond_to do |format|
      format.html

      format.pdf { render pdf: "Necessidade de Calagem",
        content: render_to_string(template: 'analises/calagem.html.erb'),
        orientation: 'Landscape',
        zoom: 0.60
        }
    end

  end
  # GET /analises
  # GET /analises.json
  def historico
    @search = Analise.where(user_id: current_user.id).ransack(params[:q])
    @analises = @search.result
    @fazendas = Fazenda.where(user_id: current_user.id).uniq.pluck(:id)
    @ano = Analise.order("ano Desc").uniq.pluck(:ano)
    @fazenda = Fazenda.uniq.pluck(:nome)
    @profundidade = Analise.uniq.pluck(:profundidade)
    @teste = Fazenda.where(user_id: current_user.id)

    respond_to do |format|
      format.html

      format.pdf { render pdf: "Histórico",
        content: render_to_string(template: 'analises/historico.html.erb'),
        orientation: 'Landscape',
        zoom: 0.60
        }
    end

  end

  def index
    @analises = Analise.where(user_id: current_user.id).order( "profundidade ASC", "talhao_id ASC")
    @fazendas = Fazenda.where(user_id: current_user.id).order("id ASC")
    @parametros = Parametro.where(user_id: current_user.id).order("ano DESC, id DESC")
    @talhao = Talhao.where(user_id: current_user.id).order("fazenda_id ASC")
  end

  # GET /analises/1
  # GET /analises/1.json
  def show
  end

  # GET /analises/new
  def new
    @analise = current_user.analises.build
  end

  # GET /analises/1/edit
  def edit
  end

  # POST /analises
  # POST /analises.json
  def create
    @analise = current_user.analises.build(analise_params)

    respond_to do |format|
      if @analise.save
        format.html { redirect_to @analise, notice: 'Analise was successfully created.' }
        format.json { render :show, status: :created, location: @analise }
      else
        format.html { render :new }
        format.json { render json: @analise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /analises/1
  # PATCH/PUT /analises/1.json
  def update
    respond_to do |format|
      if @analise.update(analise_params)
        format.html { redirect_to @analise, notice: 'Analise was successfully updated.' }
        format.json { render :show, status: :ok, location: @analise }
      else
        format.html { render :edit }
        format.json { render json: @analise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analises/1
  # DELETE /analises/1.json
  def destroy
    @analise.destroy
    respond_to do |format|
      format.html { redirect_to analises_url, notice: 'Analise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analise
      @analise = Analise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analise_params
      params.require(:analise).permit(:user_id, :fazenda_id, :talhao_id, :situacao, :profundidade, :ano, :ph, :potassio_k, :fosforo_p, :sodio_na, :calcio_ca, :magnesio_mg, :aluminio_al, :h_al, :mat_organica, :p_rem, :zinco_zn, :ferro_fe, :manganes_mn, :cobre_cu, :boro_b, :enxofre_s, :prodEsperada)
    end
end

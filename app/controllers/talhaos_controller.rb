class TalhaosController < ApplicationController
  before_action :set_talhao, only: [:show, :edit, :update, :destroy]

  # GET /talhaos
  # GET /talhaos.json
  def index
    @talhaos = Talhao.where(user_id: current_user.id).order("id ASC")
    @fazendas = Fazenda.where(user_id: current_user.id).order("id ASC")
  end

  # GET /talhaos/1
  # GET /talhaos/1.json
  def show
  end

  # GET /talhaos/new
  def new
    @talhao = current_user.talhaos.build
  end

  # GET /talhaos/1/edit
  def edit
  end

  # POST /talhaos
  # POST /talhaos.json
  def create
    @talhao = current_user.talhaos.build(talhao_params)

    respond_to do |format|
      if @talhao.save
        format.html { redirect_to @talhao, notice: 'Talhao was successfully created.' }
        format.json { render :show, status: :created, location: @talhao }
      else
        format.html { render :new }
        format.json { render json: @talhao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /talhaos/1
  # PATCH/PUT /talhaos/1.json
  def update
    respond_to do |format|
      if @talhao.update(talhao_params)
        format.html { redirect_to @talhao, notice: 'Talhao was successfully updated.' }
        format.json { render :show, status: :ok, location: @talhao }
      else
        format.html { render :edit }
        format.json { render json: @talhao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /talhaos/1
  # DELETE /talhaos/1.json
  def destroy
    @talhao.destroy
    respond_to do |format|
      format.html { redirect_to talhaos_url, notice: 'Talhao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_talhao
      @talhao = Talhao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def talhao_params
      params.require(:talhao).permit(:fazenda_id, :nome, :cultura, :variedade, :ano_plantio, :area, :esp_ruas, :esp_plantas, :argila, :silte, :areia, :user_id)
    end
end

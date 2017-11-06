class ParametrosController < ApplicationController
  before_action :set_parametro, only: [:show, :edit, :update, :destroy]

  # GET /parametros
  # GET /parametros.json
  def index
    @parametros = Parametro.where(user_id: current_user.id).order("id DESC")
  end

  # GET /parametros/1
  # GET /parametros/1.json
  def show
  end

  # GET /parametros/new
  def new
    @parametro = current_user.parametros.build
  end

  # GET /parametros/1/edit
  def edit
  end

  # POST /parametros
  # POST /parametros.json
  def create
    @parametro = current_user.parametros.build(parametro_params)

    respond_to do |format|
      if @parametro.save
        format.html { redirect_to @parametro, notice: 'Parametro was successfully created.' }
        format.json { render :show, status: :created, location: @parametro }
      else
        format.html { render :new }
        format.json { render json: @parametro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parametros/1
  # PATCH/PUT /parametros/1.json
  def update
    respond_to do |format|
      if @parametro.update(parametro_params)
        format.html { redirect_to @parametro, notice: 'Parametro was successfully updated.' }
        format.json { render :show, status: :ok, location: @parametro }
      else
        format.html { render :edit }
        format.json { render json: @parametro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parametros/1
  # DELETE /parametros/1.json
  def destroy
    @parametro.destroy
    respond_to do |format|
      format.html { redirect_to parametros_url, notice: 'Parametro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parametro
      @parametro = Parametro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parametro_params
      params.require(:parametro).permit(:ano, :parcelamento, :producao_esperada, :metodo)
    end
end

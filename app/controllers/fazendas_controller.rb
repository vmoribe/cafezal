class FazendasController < ApplicationController
  before_action :set_fazenda, only: [:show, :edit, :update, :destroy]

  # GET /fazendas
  # GET /fazendas.json
  def index
    @fazendas = Fazenda.where(user_id: current_user.id).order("id ASC")
  end

  # GET /fazendas/1
  # GET /fazendas/1.json
  def show
  end

  # GET /fazendas/new
  def new
    @fazenda = current_user.fazendas.build
  end

  # GET /fazendas/1/edit
  def edit
  end

  # POST /fazendas
  # POST /fazendas.json
  def create
    @fazenda = current_user.fazendas.build(fazenda_params)

    respond_to do |format|
      if @fazenda.save
        format.html { redirect_to @fazenda, notice: 'Fazenda was successfully created.' }
        format.json { render :show, status: :created, location: @fazenda }
      else
        format.html { render :new }
        format.json { render json: @fazenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fazendas/1
  # PATCH/PUT /fazendas/1.json
  def update
    respond_to do |format|
      if @fazenda.update(fazenda_params)
        format.html { redirect_to @fazenda, notice: 'Fazenda was successfully updated.' }
        format.json { render :show, status: :ok, location: @fazenda }
      else
        format.html { render :edit }
        format.json { render json: @fazenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fazendas/1
  # DELETE /fazendas/1.json
  def destroy
    @fazenda.destroy
    respond_to do |format|
      format.html { redirect_to fazendas_url, notice: 'Fazenda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fazenda
      @fazenda = Fazenda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fazenda_params
      params.require(:fazenda).permit(:nome, :descricao, :user_id)
    end
end

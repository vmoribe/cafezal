class VargessosController < ApplicationController
  before_action :set_vargesso, only: [:show, :edit, :update, :destroy]

  # GET /vargessos
  # GET /vargessos.json
  def index
    @vargessos = Vargesso.where(user_id: current_user.id).order("id DESC")
  end

  # GET /vargessos/1
  # GET /vargessos/1.json
  def show
  end

  # GET /vargessos/new
  def new
    @vargesso = current_user.vargessos.build
  end

  # GET /vargessos/1/edit
  def edit
  end

  # POST /vargessos
  # POST /vargessos.json
  def create
    @vargesso = current_user.vargessos.build(vargesso_params)

    respond_to do |format|
      if @vargesso.save
        format.html { redirect_to @vargesso, notice: 'Vargesso was successfully created.' }
        format.json { render :show, status: :created, location: @vargesso }
      else
        format.html { render :new }
        format.json { render json: @vargesso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vargessos/1
  # PATCH/PUT /vargessos/1.json
  def update
    respond_to do |format|
      if @vargesso.update(vargesso_params)
        format.html { redirect_to @vargesso, notice: 'Vargesso was successfully updated.' }
        format.json { render :show, status: :ok, location: @vargesso }
      else
        format.html { render :edit }
        format.json { render json: @vargesso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vargessos/1
  # DELETE /vargessos/1.json
  def destroy
    @vargesso.destroy
    respond_to do |format|
      format.html { redirect_to vargessos_url, notice: 'Vargesso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vargesso
      @vargesso = Vargesso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vargesso_params
      params.require(:vargesso).permit(:user_id, :ano, :profundidade, :areaAplicacao, :teorCalcio)
    end
end

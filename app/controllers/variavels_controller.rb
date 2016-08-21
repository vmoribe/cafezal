class VariavelsController < ApplicationController
  before_action :set_variavel, only: [:show, :edit, :update, :destroy]

  # GET /variavels
  # GET /variavels.json
  def index
    @variavels = Variavel.where(user_id: current_user.id).order("id DESC")
  end

  # GET /variavels/1
  # GET /variavels/1.json
  def show
  end

  # GET /variavels/new
  def new
    @variavel = current_user.variavels.build
  end

  # GET /variavels/1/edit
  def edit
  end

  # POST /variavels
  # POST /variavels.json
  def create
    @variavel = current_user.variavels.build(variavel_params)

    respond_to do |format|
      if @variavel.save
        format.html { redirect_to @variavel, notice: 'Variavel was successfully created.' }
        format.json { render :show, status: :created, location: @variavel }
      else
        format.html { render :new }
        format.json { render json: @variavel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /variavels/1
  # PATCH/PUT /variavels/1.json
  def update
    respond_to do |format|
      if @variavel.update(variavel_params)
        format.html { redirect_to @variavel, notice: 'Variavel was successfully updated.' }
        format.json { render :show, status: :ok, location: @variavel }
      else
        format.html { render :edit }
        format.json { render json: @variavel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variavels/1
  # DELETE /variavels/1.json
  def destroy
    @variavel.destroy
    respond_to do |format|
      format.html { redirect_to variavels_url, notice: 'Variavel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variavel
      @variavel = Variavel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def variavel_params
      params.require(:variavel).permit(:user_id, :ano, :profundidade, :areaAplicacao, :prnt)
    end
end

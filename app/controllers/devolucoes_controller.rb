class DevolucoesController < ApplicationController
  before_action :set_devolucao, only: [:show, :edit, :update, :destroy]

  # GET /devolucaos
  # GET /devolucaos.json
  def index
    @devolucaos = Devolucao.all
  end

  # GET /devolucaos/1
  # GET /devolucaos/1.json
  def show
  end

  # GET /devolucaos/new
  def new
    @devolucao = Devolucao.new
  end

  # GET /devolucaos/1/edit
  def edit
  end

  # POST /devolucaos
  # POST /devolucaos.json
  def create
    @devolucao = Devolucao.new(devolucao_params)

    respond_to do |format|
      if @devolucao.save
        format.html { redirect_to @devolucao, notice: 'Devolucao was successfully created.' }
        format.json { render :show, status: :created, location: @devolucao }
      else
        format.html { render :new }
        format.json { render json: @devolucao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devolucaos/1
  # PATCH/PUT /devolucaos/1.json
  def update
    respond_to do |format|
      if @devolucao.update(devolucao_params)
        format.html { redirect_to @devolucao, notice: 'Devolucao was successfully updated.' }
        format.json { render :show, status: :ok, location: @devolucao }
      else
        format.html { render :edit }
        format.json { render json: @devolucao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devolucaos/1
  # DELETE /devolucaos/1.json
  def destroy
    @devolucao.destroy
    respond_to do |format|
      format.html { redirect_to devolucaos_url, notice: 'Devolucao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_devolucao
      @devolucao = Devolucao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def devolucao_params
      params.require(:devolucao).permit(:aluno_id, :bibliotecario_id, :multa)
    end
end

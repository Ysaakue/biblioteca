class Admin::DevolucoesController < ApplicationController
  before_action :set_devolucao, only: [:show, :edit, :update, :destroy]

  # GET /devolucoes
  # GET /devolucoes.json
  def index
    @devolucoes = Devolucao.all
  end

  # GET /devolucoes/1
  # GET /devolucoes/1.json
  def show
  end

  # GET /devolucoes/new
  def new
    @devolucao = Devolucao.new
  end

  # GET /devolucoes/1/edit
  def edit
  end

  # POST /devolucoes
  # POST /devolucoes.json
  def create
    @devolucao = Devolucao.new(devolucao_params)

    respond_to do |format|
      if @devolucao.save
        format.html { redirect_to @devolucao, notice: 'Devolução was successfully created.' }
        format.json { render :show, status: :created, location: @devolucao }
      else
        format.html { render :new }
        format.json { render json: @devolucao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devolucoes/1
  # PATCH/PUT /devolucoes/1.json
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

  # DELETE /devolucoes/1
  # DELETE /devolucoes/1.json
  def destroy
    @devolucao.destroy
    respond_to do |format|
      format.html { redirect_to devolucoes_url, notice: 'Devolução was successfully destroyed.' }
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

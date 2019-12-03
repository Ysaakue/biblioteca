class Admin::DevolucoesController < ApplicationController
  before_action :set_devolucao, only: [:show, :edit, :update, :destroy]

  # GET /devolucoes
  # GET /devolucoes.json
  def index
    @q = Devolucao.order("created_at ASC").search(params[:q])
    @devolucoes = @q.result.page(params[:page])
    @total_registros = @q.result.count

    @alunos = User.order("nome ASC").where("role_id = ?", 2).all
    @bibliotecarios = User.order("nome ASC").where("role_id = ?", 3).all
  end

  # GET /devolucoes/1
  # GET /devolucoes/1.json
  def show
  end

  # GET /devolucoes/new
  def new
    @devolucao = Devolucao.new
    @emprestimo_id = params[:emprestimo_id]
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
        dias = (@devolucao.created_at.to_date - @devolucao.emprestimo.data_prev_dev.to_date).to_i
        if dias > 0
          @devolucao.multa = dias*0.5
        else
          @devolucao.multa = 0.0
        end
        @devolucao.save
        format.html { redirect_to admin_devolucoes_path, notice: 'Devolução was successfully created.' }
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
        format.html { redirect_to admin_devolucoes_path, notice: 'Devolucao was successfully updated.' }
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
      format.html { redirect_to admin_devolucoes_path, notice: 'Devolução was successfully destroyed.' }
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
      params.require(:devolucao).permit(:aluno_id, :bibliotecario_id, :multa,:emprestimo_id)
    end

    def change_exemplares
      @emprestimo.exemplares.each do |exemplar|
        exemplar.em_emprestimo = false
        exemplar.save
      end
    end
end

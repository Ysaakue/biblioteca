class Admin::EmprestimosController < ApplicationController
  before_action :set_emprestimo, only: [:show, :edit, :update, :destroy]

  # GET /emprestimos
  # GET /emprestimos.json
  def index
    @q = Emprestimo.order("created_at DESC").search(params[:q])
    @emprestimos = @q.result.page(params[:page])
    @total_registros = @q.result.count
  end
  
  # GET /emprestimos/1
  # GET /emprestimos/1.json
  def show
  end
  
  # GET /emprestimos/new
  def new
    @emprestimo = Emprestimo.new
    @alunos = User.order("nome ASC").where("role_id = ?", 2).all.collect {|e| [e.nome, e.id]}
    @bibliotecarios = User.order("nome ASC").where("role_id = ?", 3).all.collect {|e| [e.nome, e.id]}
    
  end
  
  # GET /emprestimos/1/edit
  def edit
    @alunos = User.order("nome ASC").where("role_id = ?", 2).all.collect {|e| [e.nome, e.id]}
    @bibliotecarios = User.order("nome ASC").where("role_id = ?", 3).all.collect {|e| [e.nome, e.id]}
  end

  # POST /emprestimos
  # POST /emprestimos.json
  def create
    set_users
    set_exemplares
    @emprestimo = Emprestimo.new(params.require(:emprestimo).permit(:aluno_id, :bibliotecario_id, :data_prev_dev, :exemplares => []))
    @emprestimo.exemplares = params[:emprestimo][:exemplares]
    @emprestimo.data_prev_dev = 10.days.after.to_date

    respond_to do |format|
      if @emprestimo.save
        change_exemplares
        format.html { redirect_to admin_emprestimo_path(@emprestimo), notice: 'Emprestimo was successfully created.' }
        format.json { render :show, status: :created, location: @emprestimo }
      else
        format.html { render :new }
        format.json { render json: @emprestimo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emprestimos/1
  # PATCH/PUT /emprestimos/1.json
  def update
    set_users
    set_exemplares
    @emprestimo.exemplares = params[:emprestimo][:exemplares]
    respond_to do |format|
      if @emprestimo.update(params.require(:emprestimo).permit(:aluno_id, :bibliotecario_id, :data_prev_dev, :exemplares))
        format.html { redirect_to admin_emprestimo_path(@emprestimo), notice: 'Emprestimo was successfully updated.' }
        format.json { render :show, status: :ok, location: @emprestimo }
      else
        format.html { render :edit }
        format.json { render json: @emprestimo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emprestimos/1
  # DELETE /emprestimos/1.json
  def destroy
    @emprestimo.destroy
    respond_to do |format|
      format.html { redirect_to admin_emprestimos_path, notice: 'Emprestimo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emprestimo
      @emprestimo = Emprestimo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emprestimo_params
      params.require(:emprestimo).permit(:aluno, :bibliotecario, :data_prev_dev, :exemplares => [])
    end

    def set_users
      params[:emprestimo][:aluno_id]= params[:emprestimo][:aluno]
      params[:emprestimo][:bibliotecario_id]= params[:emprestimo][:bibliotecario]
    end

    def set_exemplares
      exemplares = []
      params[:emprestimo][:exemplares].each do |id|
        if id != ""
          exemplares << Exemplar.find(id)
        end
      end
      params[:emprestimo][:exemplares] = exemplares
    end

    def change_exemplares
      @emprestimo.exemplares.each do |exemplar|
        exemplar.em_emprestimo = true
        exemplar.save
      end
    end
end

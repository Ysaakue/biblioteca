class Admin::AutoresController < ApplicationController
  before_action :set_autor, only: [:show, :edit, :update, :destroy]

  # GET /autores
  # GET /autores.json
  def index
    @q = Autor.order("nome ASC").search(params[:q])
    @autores = @q.result.page(params[:page])
    @total_registros = @q.result.count
  end

  # GET /autores/1
  # GET /autores/1.json
  def show
  end

  # GET /autores/new
  def new
    @autor = Autor.new
  end

  # GET /autores/1/edit
  def edit
  end

  # POST /autores
  # POST /autores.json
  def create
    @autor = Autor.new(autor_params)

    respond_to do |format|
      if @autor.save
        format.html { redirect_to admin_autor_path(@autor), notice: 'Autor foi criado com sucesso. ' }
        format.json { render :show, status: :created, location: @autor }
      else
        format.html { render :new }
        format.json { render json: @autor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /autores/1
  # PATCH/PUT /autores/1.json
  def update
    respond_to do |format|
      if @autor.update(autor_params)
        format.html { redirect_to admin_autor_path(@autor), notice: 'Edição concluída com sucesso.' }
        format.json { render :show, status: :ok, location: @autor }
      else
        format.html { render :edit }
        format.json { render json: @autor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /autores/1
  # DELETE /autores/1.json
  def destroy
    @autor.destroy
    respond_to do |format|
      format.html { redirect_to admin_autores_path, notice: 'Autor foi excluído com sucesso. ' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_autor
      @autor = Autor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def autor_params
      params.require(:autor).permit(:nome)
    end
end

class Admin::ExemplaresController < ApplicationController
  before_action :set_exemplar, only: [:show, :edit, :update, :destroy]

  # GET /exemplares
  # GET /exemplares.json
  def index
    @exemplares = Exemplar.all
  end

  # GET /exemplares/1
  # GET /exemplares/1.json
  def show
  end

  # GET /exemplares/new
  def new
    @exemplar = Exemplar.new
  end

  # GET /exemplares/1/edit
  def edit
  end

  # POST /exemplares
  # POST /exemplares.json
  def create
    @exemplar = Exemplar.new(exemplar_params)

    respond_to do |format|
      if @exemplar.save
        format.html { redirect_to @exemplar, notice: 'Exemplar was successfully created.' }
        format.json { render :show, status: :created, location: @exemplar }
      else
        format.html { render :new }
        format.json { render json: @exemplar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exemplares/1
  # PATCH/PUT /exemplares/1.json
  def update
    respond_to do |format|
      if @exemplar.update(exemplar_params)
        format.html { redirect_to @exemplar, notice: 'Exemplar was successfully updated.' }
        format.json { render :show, status: :ok, location: @exemplar }
      else
        format.html { render :edit }
        format.json { render json: @exemplar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exemplares/1
  # DELETE /exemplares/1.json
  def destroy
    @exemplar.destroy
    respond_to do |format|
      format.html { redirect_to exemplares_url, notice: 'Exemplar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exemplar
      @exemplar = Exemplar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exemplar_params
      params.require(:exemplar).permit(:livro_id, :emprestimo_id, :aquisicao, :situacao, :em_emprestimo)
    end
end

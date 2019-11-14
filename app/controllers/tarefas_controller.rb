class TarefasController < ApplicationController
  before_action :set_tarefa, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /tarefas
  # GET /tarefas.json
  def index
    if current_user.admin?
      @tarefas = Tarefa.all
    else
      @tarefas = Tarefa.where(user: current_user)
    end
  end

  # GET /tarefas/1
  # GET /tarefas/1.json
  def show
  end

  # GET /tarefas/new
  def new
    @tarefa = Tarefa.new
  end

  # GET /tarefas/1/edit
  def edit
  end

  # POST /tarefas
  # POST /tarefas.json
  def create
    @tarefa = Tarefa.new(tarefa_params)
    @tarefa.user = current_user
    respond_to do |format|
      if @tarefa.save
        format.html { redirect_to @tarefa, notice: 'Tarefa was successfully created.' }
        format.json { render :show, status: :created, location: @tarefa }
      else
        format.html { render :new }
        format.json { render json: @tarefa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tarefas/1
  # PATCH/PUT /tarefas/1.json
  def update
    respond_to do |format|
      if @tarefa.update(tarefa_params)
        format.html { redirect_to @tarefa, notice: 'Tarefa was successfully updated.' }
        format.json { render :show, status: :ok, location: @tarefa }
      else
        format.html { render :edit }
        format.json { render json: @tarefa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tarefas/1
  # DELETE /tarefas/1.json
  def destroy
    @tarefa.destroy
    respond_to do |format|
      format.html { redirect_to tarefas_url, notice: 'Tarefa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarefa
      if current_user.admin?
        @tarefa = Tarefa.find(params[:id])
      else
        begin
         @tarefa = Tarefa.where(user: current_user).find(params[:id])
        rescue Exception
          redirect_to tarefas_path, notice: 'Esta tarefa não te pertencee'
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tarefa_params
      params.require(:tarefa).permit(:title, :body, :date)
    end
end

class PhasesController < ApplicationController
  before_action :get_project
  before_action :set_phase, only: %i[ show edit update destroy ]

  # GET /phases or /phases.json
  def index
    @phases =  @project.phases
  end

  # GET /phases/1 or /phases/1.json
  def show
  end

  # GET /phases/new
  def new
    @phase = @project.phases.build
  end
  # GET /phases/1/edit
  def edit
  end

  # POST /phases or /phases.json
  def create
    @phase = @project.phases.build(phase_params)

    respond_to do |format|
      if @phase.save
        format.html { redirect_to project_phases_path(@project), notice: "Phase was successfully created." }
        format.json { render :show, status: :created, location: @phase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phases/1 or /phases/1.json
  def update
    respond_to do |format|
      if @phase.update(phase_params)
        format.html { redirect_to project_phase_path(@project), notice: "Phase was successfully updated." }
        format.json { render :show, status: :ok, location: @phase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phases/1 or /phases/1.json
  def destroy
    @phase.destroy

    respond_to do |format|
      format.html { redirect_to project_phases_path(@project), notice: "Phase was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_project
      @project = Project.find(params[:project_id])
    end

    def set_phase
      @phase = @project.phases.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def phase_params
      params.require(:phase).permit(:name, :end_date, :project_id)
    end
end

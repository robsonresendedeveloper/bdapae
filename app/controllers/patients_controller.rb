class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:index,:show,:new, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    if params[:term]
      @patients = Patient.where('name LIKE ?', "%#{params[:term]}%")
    else
      @patients = Patient.all
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
    @patient.born =  @patient.born.to_time.strftime("%d/%m/%Y").to_s
    @patient.entry_date =  @patient.entry_date.to_time.strftime("%d/%m/%Y").to_s
    @patient.exit_date =  @patient.exit_date.to_time.strftime("%d/%m/%Y").to_s
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def authenticate_user
      if !user_signed_in?
        redirect_to root_path
        flash[:danger] = "Você não tem acesso a essa área"
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:name, :sex, :born, :mother_name, :father_name, :entry_date, :exit_date, :infos, :term)
    end
end

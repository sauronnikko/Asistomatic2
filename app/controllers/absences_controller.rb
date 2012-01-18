class AbsencesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :find_employee

  def find_employee
    @employee = Employee.find(params[:employee_id])
  end

  # GET /absences
  # GET /absences.json
  def index
    @absences = @employee.absences
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @absences }
    end
  end

  # GET /absences/1
  # GET /absences/1.json
  def show
    @absence = Absence.find(params[:id])
   
 
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @absence }
    end
  end

  # GET /absences/new
  # GET /absences/new.json
  def new
    @absence = @employee.absences.build
    @work_dates = Period.first.work_dates
    @schedules = Period.first.schedules

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @absence }
    end
  end

  # GET /absences/1/edit
  def edit
    @absence = Absence.find(params[:id])
    @work_dates = Period.first.work_dates
    @schedules = Period.first.schedules
  end

  # POST /absences
  # POST /absences.json
  def create
    @absence = @employee.absences.build(params[:absence])
    respond_to do |format|
      if @absence.save
        format.html { redirect_to [@employee, @absence], notice: 'La inasistencia fue exitosamente creada' }
        format.json { render json: @absence, status: :created, location: @absence }
      else
        @work_dates = Period.first.work_dates
        @schedules = Period.first.schedules
        format.html { render action: "new" }
        format.json { render json: @absence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /absences/1
  # PUT /absences/1.json
  def update
    @absence = Absence.find(params[:id])

    respond_to do |format|
      if @absence.update_attributes(params[:absence])
        format.html { redirect_to [@employee, @absence], notice: 'La inasistencia fue exitosamente actualizada.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @absence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /absences/1
  # DELETE /absences/1.json
  def destroy
    @absence = Absence.find(params[:id])
    @absence.destroy

    respond_to do |format|
      format.html { redirect_to employee_absences_path(@employee) }
      format.json { head :ok }
    end
  end
end

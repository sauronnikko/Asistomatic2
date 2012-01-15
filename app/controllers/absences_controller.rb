class AbsencesController < ApplicationController

  # GET /absences
  # GET /absences.json
  def index
    @employee = Employee.find(params[:employee_id])
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
    @employee = Employee.find(params[:employee_id])
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
  end

  # POST /absences
  # POST /absences.json
  def create
    @employee = Employee.find(params[:employee_id])
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
        format.html { redirect_to @absence, notice: 'Absence was successfully updated.' }
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
      format.html { redirect_to absences_url }
      format.json { head :ok }
    end
  end
end

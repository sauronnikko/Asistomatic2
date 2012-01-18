class PeriodsController < ApplicationController


  before_filter :authenticate_user!

  def dates
    @period = Period.find(params[:id])
    @work_dates = @period.work_dates
    @schedules = @period.schedules 
    render :partial => "dates", :locals => { :work_dates => @work_dates, :schedules => @schedules, :schedule => @schedules.first }
  end


  # GET /periods
  # GET /periods.json
  def index
    @periods = Period.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @periods }
    end
  end

  # GET /periods/1
  # GET /periods/1.json
  def show
    @period = Period.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @period }
    end
  end

  # GET /periods/new
  # GET /periods/new.json
  def new
    @period = Period.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @period }
    end
  end

  # GET /periods/1/edit
  def edit
    @period = Period.find(params[:id])
  end

  # POST /periods
  # POST /periods.json
  def create
    @period = Period.new(params[:period])

    respond_to do |format|
      if @period.save
        format.html { redirect_to @period, notice: 'El Periodo fue exitosamente creado.' }
        format.json { render json: @period, status: :created, location: @period }
      else
        format.html { render action: "new" }
        format.json { render json: @period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /periods/1
  # PUT /periods/1.json
  def update
    @period = Period.find(params[:id])
    @period.old_start_date = @period.start_date
    @period.old_end_date = @period.end_date

    respond_to do |format|
      if @period.update_attributes(params[:period])
        @period.create_new_work_dates
        @period.destroy_orphaned_work_dates
        format.html { redirect_to @period, notice: 'El Período fue exitosamente actualizado.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /periods/1
  # DELETE /periods/1.json
  def destroy
    @period = Period.find(params[:id])
    @period.destroy

    respond_to do |format|
      format.html { redirect_to periods_url }
      format.json { head :ok }
    end
  end
end

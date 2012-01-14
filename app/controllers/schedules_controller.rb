class SchedulesController < ApplicationController


  def schedule_blocks
    @schedule = Schedule.find(params[:id])
    render :partial => "periods/schedules_schedule_blocks", :locals => { :schedule => @schedule }
  end

  # GET /schedules
  # GET /schedules.json
  def index
    @period = Period.find(params[:period_id])
    @schedules = Schedule.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedules }
    end
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    @period = Period.find(params[:period_id])
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schedule }
    end
  end

  # GET /schedules/new
  # GET /schedules/new.json
  def new
    @period = Period.find(params[:period_id])
    @schedule = Schedule.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @schedule }
    end
  end

  # GET /schedules/1/edit
  def edit
    @period = Period.find(params[:period_id])
    @schedule = Schedule.find(params[:id])
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @period = Period.find(params[:period_id])
    @schedule = @period.schedules.build(params[:schedule])

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to [@period, @schedule], notice: 'El horario ha sido exitosamente creado' }
        format.json { render json: [@period, @schedule], status: :created, location: @schedule }
      else
        format.html { render action: "new" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schedules/1
  # PUT /schedules/1.json
  def update
    @period = Period.find(params[:period_id])
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        format.html { redirect_to [@period, @schedule], notice: 'El horario fue exitosamente actualizado.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to schedules_url }
      format.json { head :ok }
    end
  end
end

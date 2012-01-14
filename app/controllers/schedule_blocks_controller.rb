class ScheduleBlocksController < ApplicationController

  before_filter :find_period
  before_filter :find_schedule

  def find_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end

  def find_period
    @period = Period.find(params[:period_id])
  end

  # GET /schedule_blocks
  # GET /schedule_blocks.json
  def index
    @schedule_blocks = ScheduleBlock.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedule_blocks }
    end
  end

  # GET /schedule_blocks/1
  # GET /schedule_blocks/1.json
  def show
    @schedule_block = ScheduleBlock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schedule_block }
    end
  end

  # GET /schedule_blocks/new
  # GET /schedule_blocks/new.json
  def new
    @schedule = Schedule.find(params[:schedule_id])
    @schedule_block = ScheduleBlock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @schedule_block }
    end
  end

  # GET /schedule_blocks/1/edit
  def edit
    @schedule = Schedule.find(params[:schedule_id])
    @schedule_block = ScheduleBlock.find(params[:id])
  end

  # POST /schedule_blocks
  # POST /schedule_blocks.json
  def create
    @schedule = Schedule.find(params[:schedule_id])
    @schedule_block = @schedule.schedule_blocks.build(params[:schedule_block]) 

    respond_to do |format|
      if @schedule_block.save
        format.html { redirect_to [@schedule.period, @schedule], notice: 'El Bloque de Horario fue creado exitosamente' }
        format.json { render json: @schedule_block, status: :created, location: @schedule_block }
      else
        format.html { render action: "new" }
        format.json { render json: @schedule_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schedule_blocks/1
  # PUT /schedule_blocks/1.json
  def update
    @schedule_block = ScheduleBlock.find(params[:id])

    respond_to do |format|
      if @schedule_block.update_attributes(params[:schedule_block])
        format.html { redirect_to [@period, @schedule, @schedule_block], notice: 'El bloque de horario ha sido actualizado exitosamente' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_blocks/1
  # DELETE /schedule_blocks/1.json
  def destroy
    @schedule_block = ScheduleBlock.find(params[:id])
    @schedule_block.destroy

    respond_to do |format|
      format.html { redirect_to period_schedule_path(@period, @schedule) }
      format.json { head :ok }
    end
  end
end

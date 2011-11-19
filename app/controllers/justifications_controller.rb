class JustificationsController < ApplicationController
  # GET /justifications
  # GET /justifications.json
  def index
    @justifications = Justification.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @justifications }
    end
  end

  # GET /justifications/1
  # GET /justifications/1.json
  def show
    @justification = Justification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @justification }
    end
  end

  # GET /justifications/new
  # GET /justifications/new.json
  def new
    @justification = Justification.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @justification }
    end
  end

  # GET /justifications/1/edit
  def edit
    @justification = Justification.find(params[:id])
  end

  # POST /justifications
  # POST /justifications.json
  def create
    @justification = Justification.new(params[:justification])

    respond_to do |format|
      if @justification.save
        format.html { redirect_to @justification, notice: 'Justification was successfully created.' }
        format.json { render json: @justification, status: :created, location: @justification }
      else
        format.html { render action: "new" }
        format.json { render json: @justification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /justifications/1
  # PUT /justifications/1.json
  def update
    @justification = Justification.find(params[:id])

    respond_to do |format|
      if @justification.update_attributes(params[:justification])
        format.html { redirect_to @justification, notice: 'Justification was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @justification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /justifications/1
  # DELETE /justifications/1.json
  def destroy
    @justification = Justification.find(params[:id])
    @justification.destroy

    respond_to do |format|
      format.html { redirect_to justifications_url }
      format.json { head :ok }
    end
  end
end

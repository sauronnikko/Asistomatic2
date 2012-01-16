class AllAbsencesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @absences = Absence.joins(:work_date).order("work_dates.work_date DESC").limit(100)
  end

end

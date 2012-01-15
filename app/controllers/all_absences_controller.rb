class AllAbsencesController < ApplicationController
  def index
    @absences = Absence.joins(:work_date).order("work_dates.work_date DESC").limit(100)
  end

end

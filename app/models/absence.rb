class Absence < ActiveRecord::Base

  belongs_to :employee
  belongs_to :work_date

  validates :employee_id, :presence => true
  validates :date_id, :presence => true

  


end

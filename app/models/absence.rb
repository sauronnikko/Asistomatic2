class Absence < ActiveRecord::Base

  belongs_to :employee
  belongs_to :date

  validates :employee_id, :presence => true
  validates :date_id, :presence => true

  


end

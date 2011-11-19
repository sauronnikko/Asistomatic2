class Absence < ActiveRecord::Base

  belongs_to :employee
  belongs_to :work_date
  has_one :justification, :dependent => :destroy

  validates :employee_id, :presence => true
  validates :date_id, :presence => true

  


end

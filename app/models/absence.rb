class Absence < ActiveRecord::Base

  belongs_to :employee
  belongs_to :work_date

  has_many :absence_schedule_blocks, :dependent => :destroy
  has_many :schedule_blocks, :through => :absence_schedule_blocks

  has_one :justification, :dependent => :destroy

  validates :employee, :presence => true
  validates :work_date_id, :presence => true
  validates :schedule_blocks, :presence => true

  def period
    (self.work_date ? self.work_date.period : nil)
  end  


end

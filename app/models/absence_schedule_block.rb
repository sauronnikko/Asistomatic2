class AbsenceScheduleBlock < ActiveRecord::Base

  belongs_to :absence
  belongs_to :schedule_block

  validates :absence_id, :presence => true
  validates :schedule_block_id, :presence => true

  validates_uniqueness_of :schedule_block_id, :scope => :absence_id

end

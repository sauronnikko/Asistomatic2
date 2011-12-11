class WorkDate < ActiveRecord::Base

  belongs_to :period
  has_many :absences, :dependent => :destroy

  validates :work_date, :presence => true,
                        :uniqueness => true
  validates :period_id, :presence => true
  
  

end

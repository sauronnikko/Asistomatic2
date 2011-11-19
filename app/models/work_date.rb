class WorkDate < ActiveRecord::Base

  has_many :absences, :dependent => :destroy

  validates :work_date, :presence => true,
                        :uniqueness => true
  
  
  

end

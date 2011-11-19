class WorkDate < ActiveRecord::Base

  has_many :absences

  validates :work_date, :presence => true,
                        :uniqueness => true
  
  
  

end

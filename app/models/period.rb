class Period < ActiveRecord::Base

  has_many :schedules, :dependent => :destroy

  [:name, :start_date, :end_date].each do |attr|
    validates attr, :presence => true
  end
  
  [:name, :code, :start_date, :end_date].each do |attr|
    validates_uniqueness_of attr 
  end

  validates_date :start_date
  validates_date :end_date, :after => lambda { :start_date }

end

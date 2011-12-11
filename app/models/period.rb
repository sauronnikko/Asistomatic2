class Period < ActiveRecord::Base

  attr_accessor :old_start_date, :old_end_date

  has_many :schedules, :dependent => :destroy
  has_many :work_dates, :dependent => :destroy

  [:name, :start_date, :end_date].each do |attr|
    validates attr, :presence => true
  end
  
  [:name, :code, :start_date, :end_date].each do |attr|
    validates_uniqueness_of attr 
  end

  validates_date :start_date
  validates_date :end_date, :after => lambda { :start_date }

  after_create :create_work_dates

  def create_work_dates
    (self.start_date..self.end_date).each do |date|
      self.work_dates.create(:work_date => date)
    end
  end

  def create_new_work_dates
    (self.start_date..self.old_start_date).each do |date|
      self.work_dates.create(:work_date => date)
    end 
    (self.old_end_date..self.end_date).each do |date|
      self.work_dates.create(:work_date => date)
    end 
  end


  def destroy_orphaned_work_dates 
    self.work_dates.where("work_date < ? OR work_date > ?", self.start_date, self.end_date).destroy_all  
  end

end

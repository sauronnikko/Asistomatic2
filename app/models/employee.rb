class Employee < ActiveRecord::Base

  has_many :absences, :dependent => :destroy

  validates_presence_of :first_name
  validates_presence_of :first_last_name
  validates_presence_of :unique_id

  validates_uniqueness_of :unique_id

  def full_name
    "#{self.first_name} #{self.first_last_name}"
  end

end

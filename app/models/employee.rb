class Employee < ActiveRecord::Base

  validates_presence_of :first_name
  validates_presence_of :first_last_name
  validates_presence_of :unique_id

  validates_uniqueness_of :unique_id

end
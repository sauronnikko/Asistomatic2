class Period < ActiveRecord::Base

  has_many :periods

  validates_presence_of :name
  
  validates_uniqueness_of :name
  validates_uniqueness_of :code

end

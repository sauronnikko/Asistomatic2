class Schedule < ActiveRecord::Base

  belongs_to :period

  validates_presence_of :name
  validates_presence_of :period_id

  validates_uniqueness_of :name, [:period_id]


end

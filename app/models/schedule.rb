class Schedule < ActiveRecord::Base

  belongs_to :period
  has_many :schedule_blocks, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :period_id

  validates_uniqueness_of :name, :scope => :period_id


end

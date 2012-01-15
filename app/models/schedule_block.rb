class ScheduleBlock < ActiveRecord::Base

  belongs_to :schedule
  has_many :absence_schedule_blocks, :dependent => :destroy
  has_many :absences, :through => :absence_schedule_blocks


  [:start_time, :end_time, :schedule_id].each do |attr|
    validates attr, :presence => true
  end

  validates_uniqueness_of :start_time, :scope => :schedule_id
  validates_uniqueness_of :end_time, :scope => :schedule_id

  validates_time :start_time
  validates_time :end_time, :after => lambda { :start_time }

  validate :not_overlapping

  def time_range
    "#{self.start_time.strftime("%I:%M %p")} - #{self.end_time.strftime("%I:%M %p")}"
  end

  def not_overlapping
    schedule_blocks = ScheduleBlock.find_all_by_schedule_id(self.schedule.id)
    schedule_blocks.each do |sb|
      if (ScheduleBlock.minute_day(self.start_time) - ScheduleBlock.minute_day(sb.end_time)) * (ScheduleBlock.minute_day(sb.start_time) - ScheduleBlock.minute_day(self.end_time)) > 0 and not sb == self
        self.errors.add(:start_time, "y Hora Final no pueden solaparse con otro bloque de horario presente en este horario")
        return
      end
    end
  end

  def self.minute_day(time_obj)
    time_obj.hour * 60 + time_obj.min
  end

end

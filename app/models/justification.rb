class Justification < ActiveRecord::Base

  belongs_to :absence

  [:description, :absence_id].each do |attr|
    validates attr, :presence => true
  end

  validates_uniqueness_of :absence_id

end

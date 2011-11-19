class Justification < ActiveRecord::Base

  belongs_to :absence

  [:description, :is_justified, :absence_id].each do |attr|
    validates attr, :presence => true
  end

end

class Activity < ActiveRecord::Base
  attr_accessible :end_time, :start_time
  belongs_to :app
end

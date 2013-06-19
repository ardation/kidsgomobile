class Call < ActiveRecord::Base
  attr_accessible :date, :duration, :type
  belongs_to :numbers
end

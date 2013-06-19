class Message < ActiveRecord::Base
  attr_accessible :body, :date, :type
  belongs_to :number
end

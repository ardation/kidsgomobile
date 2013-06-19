class Number < ActiveRecord::Base
  attr_accessible :number
  belongs_to :contact
  has_many :messages
  has_many :calls
end

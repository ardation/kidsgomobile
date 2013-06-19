class App < ActiveRecord::Base
  attr_accessible :name, :nice_name
  belongs_to :device
  has_many :activities
end

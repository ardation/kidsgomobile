class Contact < ActiveRecord::Base
  attr_accessible :device_id, :name, :remote_id
  has_many :numbers
  has_many :messages, through: :numbers
  belongs_to :device
end

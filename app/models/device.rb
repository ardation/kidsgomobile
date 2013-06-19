class Device < ActiveRecord::Base
  attr_accessible :code, :name, :model
  belongs_to :user
  has_many :contacts
  has_many :apps

  before_create :generate_token

  def self.from_access_token(token)
    Device.find_by_token(token)
  end

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64
      break random_token unless Device.where(token: random_token).exists?
    end
  end

end

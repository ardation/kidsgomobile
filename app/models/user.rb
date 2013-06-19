class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :terms, :provider, :uid, :fname, :lname

  validates :terms, :acceptance => {:accept => true}
  validates_presence_of :fname
  # attr_accessible :title, :body

  devise :omniauthable, :omniauth_providers => [:facebook, :twitter, :google_oauth2]

  has_many :devices

  def self.find_for_oauth(auth)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.oauth_data"] && session["devise.oauth_data"]["extra"]["raw_info"]
        user.provider = session["devise.oauth_data"]["provider"]
        user.uid = session["devise.oauth_data"]["uid"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def name
    "#{self.fname} #{self.lname}"
  end

  def get_device_token
    self.device_token = loop do
      random_token = Random.new.rand(100_000..1_000_000-1)
      break random_token unless User.where(device_token: random_token).exists?
    end
    self.save
    return self.device_token
  end

end

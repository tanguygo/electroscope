class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :flats
  has_many :orders
  has_many :box_sessions, through: :flats


  def sponsor
    s=Sponsorship.where(receiver_id:self.id).first
    return s.giver if s
  end

  def sponsored
    s=Sponsorship.where(giver_id:self.id)
    if s
      u=[]
      s.each{|sponsorship|
        u<<s.receiver
      }
      return u
    end

  end


  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [ :facebook ]

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.name = auth.info.name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

  def flat
    Flat.find_by user_id: self.id
  end
end



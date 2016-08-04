class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable, :omniauth_providers => [:twitter]

  has_many :polls
  has_many :votes

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      #twitter doesn't provide email through their API
      # raise auth.provider.inspect
      user.email = "#{auth.info.name}@twitter.com"
      user.password = Devise.friendly_token[0,20]
    end
  end
end

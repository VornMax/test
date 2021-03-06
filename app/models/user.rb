class User < ApplicationRecord

  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :timeoutable, :lockable, :omniauthable, omniauth_providers: [:facebook]

  enum role: [:member, :moderator, :admin]
  
  has_many :articles
  has_many :comments
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end

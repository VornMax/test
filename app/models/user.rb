class User < ApplicationRecord

  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :timeoutable, :lockable, :omniauthable, omniauth_providers: [:facebook]
  
  has_many :articles
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  # def maks?
  #   email == "maks@gmail.com"
  # end
  
  # def vasya_pupkin?
  #   email == "vasya_pupkin@gmail.com"
  # end
end

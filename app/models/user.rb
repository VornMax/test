class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def maks?
    email == "maks@gmail.com"
  end
  
  def vasya_pupkin?
    email == "vasya_pupkin@gmail.com"
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def ban?
    email == "maks@gmail.com"
  end

  def vasya?
    email == "vasya@gmail.com"
  end

  def vanya?
    email == "vanya@gmail.com"
  end

  def tanya?
    email == "tanya@gmail.com"
  end

  def bil?
    email == "bil@gmail.com"
  end

  def jack?
    email == "jack@gmail.com"
  end

end

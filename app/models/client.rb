class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :company
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

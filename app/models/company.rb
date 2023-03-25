class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 has_many :estimates
 has_many :images
 mount_uploader :image, ImagesUploader
 #validates :company, {presence: true}#会社名
 #validates :name, {presence: true}#代表者
 #validates :tel, {presence: true}
 #validates :mail, {presence: true}#URL
end

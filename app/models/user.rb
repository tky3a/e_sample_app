class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #name情報が必須でnameが無いと保存できない + 最大50文字まで
  validates :name, presence: true, length: {maximum: 50}
end

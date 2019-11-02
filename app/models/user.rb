class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :nickname, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 7 } 
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :first_name_kana, presence: true
    validates :last_name_kana, presence: true
    validates :phone_number, presence: true, uniqueness: true
    validates :birth_year_on, presence: true
    validates :birth_month_on, presence: true
    validates :birth_day_on, presence: true
    
    
end

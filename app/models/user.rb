class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  
  has_many :addresses
  has_many :sns_credentials
  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :sns_credentials
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :sale_items, -> { where("buyer_id is NULL") }, foreign_key:"saler_id", class_name:"Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key:"saler_id", class_name: "Item"

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

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

  def self.without_sns_data(auth)
    user = User.where(email: auth.info.email).first

      if user.present?
        sns = SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          user_id: user.id
        )
      else
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email,
        )
        sns = SnsCredential.new(
          uid: auth.uid,
          provider: auth.provider
        )
      end
      return { user: user ,sns: sns}
  end

  def self.with_sns_data(auth, snscredential)
    user = User.where(id: snscredential.user_id).first
    unless user.present?
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
      )
    end
    return {user: user}
  end

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user ,sns: sns}
  end
    
end

class User < ApplicationRecord
<<<<<<< HEAD
  has_many :comments , foreign_key: :commentor_id
  has_many :companies , foreign_key: :creator_id
  has_many :reviews , foreign_key: :reviewer_id
  has_many :likes  , foreign_key: :liker_id
=======
	has_many :companies, foreign_key: :creator_id
  has_many :reviews
  has_many :likes
>>>>>>> 104b52ccf491a18604616002b3b5e9dc83c730f1
  has_many :friendships
  has_many :friends, through: :friendships, foreign_key: :friend_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable

 def self.from_omniauth(auth)  
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end

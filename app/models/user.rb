class User < ApplicationRecord
  #after_save :updater
  before_create :set_login

  has_many :posts
  has_many :comments
  has_many :likes , as: :likeable, :dependent => :destroy
  has_one :account
  has_many :replies ,dependent: :destroy
  has_one :items
  #Include default devise modules. Others available are:
  #:confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable ,:recoverable, :rememberable, :trackable, :validatable, :lockable, :omniauthable, :omniauth_providers => [:twitter ,:google_oauth2]

  
  def login=(login)
    @login = login
  end

  # validates :username,
  #  :presence => true,
  #  :uniqueness => {
  #  :case_sensitive => false
  # }

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
       where(conditions.to_h).where(["(lower(username) = :value) OR (lower(email) = :value) OR (lower(mobile_number) = :value)", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
  end


# def updater
#  self.lastname(:lastname, "sharma")
# end
  def set_login
    self.login = self.username
  end

  def self.from_omniauth(auth)
   user = User.where(:email => auth.info.email).first

   if user
     return user
   else
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.firstname = auth.info.name
       user.provider = auth.provider
       user.uid = auth.uid
       user.email =  auth.uid + "@gmail.com"
       user.password = Devise.friendly_token[0,20]
     end
   end
 end

  # def self.google_oauth2(auth)
    
   
  # end

  # def self.from_omniauth(access_token)
  #   data = access_token.info
  #   user = User.where(email: data['email']).first

  #   # Uncomment the section below if you want users to be created if they don't exist
  #   # unless user
  #   #     user = User.create(name: data['name'],
  #   #        email: data['email'],
  #   #        password: Devise.friendly_token[0,20]
  #   #     )
  #   # end
  #   user
  # end
  
end
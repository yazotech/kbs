class User < ActiveRecord::Base
     belongs_to :client
    
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login_name]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login_name, :email, :password, :password_confirmation, :remember_me , :client_id

   def self.find_for_database_authentication(warden_conditions)
   conditions = warden_conditions.dup
   login = conditions.delete(:login_name)
   where(conditions).where(["lower(login_name) = :value OR lower(email) = :value", { :value => login.strip.downcase }]).first
 end

end

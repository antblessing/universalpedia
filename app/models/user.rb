class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save { self.role ||= :standard }
  
  has_many :collaborations
  has_many :wikis
  
  enum role: [:standard, :premium, :admin]
  
  def standard?
    role == "standard"
  end
  
  def premium?
    role == "premium"
  end
  
  def admin?
    role == "admin"
  end
  
  #def collaborated_on
    #Collaboration.where(user_id: id)
  #end
end

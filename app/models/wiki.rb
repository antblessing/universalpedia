class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations
  has_many :users, through: :collaborations
  
  #def collaborations
    #Collaboration.where(wiki_id: id)
  #end
end

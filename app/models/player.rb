class Player <ActiveRecord::Base
    belongs_to :user
    has_many :coaches, through: :user

    
     
end
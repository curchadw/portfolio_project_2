class Team <ActiveRecord::Base
has_many :players
has_many :coaches
has_secure_password

  


end
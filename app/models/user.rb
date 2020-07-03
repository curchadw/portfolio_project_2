class User <ActiveRecord::Base
    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
    # validates :username, uniqueness: true,case_sensitive: false
    has_many :players

    has_secure_password
    
    
  


end
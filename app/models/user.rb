class User <ActiveRecord::Base
    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
    validates_uniqueness_of :username, case_sensitive: false
    has_many :players

    has_secure_password
    
    
  


end
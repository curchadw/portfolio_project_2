class User <ActiveRecord::Base
    include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods

    has_many :players

    has_secure_password

  


end
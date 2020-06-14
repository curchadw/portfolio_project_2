class Coach <ActiveRecord::Base
has_many :players, through: :team
belongs_to :team
end
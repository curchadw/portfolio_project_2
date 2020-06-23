class Player <ActiveRecord::Base
    belongs_to :team
    has_many :coaches, through: :team

      def slug
        name.downcase.gsub(" ","-")
      end
    
      def self.find_by_slug(slug)
        Player.all.find{|player| player.slug == slug}
      end
    
end
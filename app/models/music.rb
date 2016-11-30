class Music < ActiveRecord::Base
    belongs_to :location
    
    def Music.get_musics_by_location(location)
        Music.where(:location => location)
    end
    
    def Music.get_most_played(location)
        
        Music.get_musics_by_location(location)
    end
    
end

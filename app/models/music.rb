class Music < ActiveRecord::Base
  belongs_to :location

  def Music.get_musics_by_location(location)
    Music.where(:location => location)
  end

  def Music.get_most_played(location)

    distancias = [1,3,5,10,100,1000,5000,10000,20000]
    @musics = []
    for index in 0 ... distancias.size
        @locations = Location.get_by_distance(location, distancias[index])
        locations_ids = []
        @locations.each do |l|
          locations_ids.push(l.id)
        end

        unless @locations.blank?
          @musics = Music.group(:track_name).where(location_id: locations_ids).limit(10).order('COUNT(*) DESC').count
          break
        end
    end

    @musics

  end
  
  def Music.get_spotify_most_played(location)
    
    musics = Music.get_most_played(location)
    spotify_musics = []

    musics.each do |music|
      m = RSpotify::Track.search(music[0]).first
      spotify_musics.push(m) unless m.nil?
    end
    
    spotify_musics
    
  end

  def Music.get_embed_most_played(location)

    musics = Music.get_most_played(location)
    spotify_musics = []

    musics.each do |music|
      m = RSpotify::Track.search(music[0]).first
      iframe = m.embed({height: 80})
      spotify_musics.push(iframe) unless m.nil?
    end

    spotify_musics

  end

end

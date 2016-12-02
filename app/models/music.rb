class Music < ActiveRecord::Base
  belongs_to :location

  def Music.get_musics_by_location(location)
    Music.where(:location => location)
  end

  def Music.get_most_played(location)
    
    distancias = [1,3,5,10]
    @musics = []
    for index in 0 ... distancias.size
        @locations = Location.get_by_distance(location, distancias[index])
        locations_ids = []
        @locations.each do |l|
          # @musics.push(Music.get_musics_by_location(l))
          locations_ids.push(l.id)
        end
    
        puts "locs #{@locations}"
    
        unless @locations.blank?
          @musics = Music.group(:track_name).where(location_id: locations_ids).count
          @musics.values.sort! {|x,y| x[1] <=> y[1]}
          break
        end
    end
    
    @musics

  end

end

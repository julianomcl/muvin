class Music < ActiveRecord::Base
  belongs_to :location

  def Music.get_musics_by_location(location)
    Music.where(:location => location)
  end

  def Music.get_most_played(location)
    @locations = Location.get_by_distance(location, 1)
    @musics = []
    locations_ids = []
    @locations.each do |l|
      # @musics.push(Music.get_musics_by_location(l))
      locations_ids.push(l.id)
    end

    puts @locations

    unless @locations.blank?
      @musics = Music.group(:track_name).where(location_id: locations_ids).count
      @musics.values.sort! {|x,y| x[1] <=> y[1]}
    end

    @musics

  end

end

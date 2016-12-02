module LastfmHelper
    require 'net/http'
    require 'json'
    
    APIKEY = '5da1c00d06ef449b8c672b4be3ebda79'
    private_constant :APIKEY
    
    def get_recent_tracks(userid, days_span, location)
        user = User.find(userid)
        if user.nil? then
            return nil
        end
        url = 'http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=' + user.lastfm_username + '&api_key=' + APIKEY + '&format=json'
        puts url
        uri = URI(url)
        response = Net::HTTP.get(uri)
        responsehash = JSON.parse(response)
        if !responsehash["error"].nil?
            return nil
        end
        hash = responsehash["recenttracks"]["track"]
        last_song = Date.today - days_span
        if !location.nil? && location.musics.any? then
            last_song = location.musics.maximum("created_at")
        end
        validsongs = Hash.new
        i = 0
        for index in 0 ... hash.size
            track = hash[index]
            puts track
            t = Time.at(Integer(track['date']['uts']))
            if(t < last_song)
                next
            end
            validsongs[i] = track
            i += 1
        end
        return validsongs
    end
end

module LastfmHelper
    require 'net/http'
    require 'json'
    
    APIKEY = '5da1c00d06ef449b8c672b4be3ebda79'
    private_constant :APIKEY
    
    def get_recent_tracks(username, days_span)
        puts "days_span: #{days_span}"
        url = 'http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=' + username + '&api_key=' + APIKEY + '&format=json'
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)["recenttracks"]["track"]
        for index in 0 ... hash.size
            track = hash[index]
            t = Time.at(Integer(track['date']['uts']))
            if t < Time.now - days_span.days
                next
            end
            #puts "#{track['artist']['#text']} - #{track['name']} = #{t}" #exemplo de fetch
        end
    end
end

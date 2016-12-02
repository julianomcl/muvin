require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, 'e88b652294534e41aa46f9845bc3c6a3', 'c18c2c68c9de462db109ccc91af71e49', scope: 'user-top-read user-read-email playlist-modify-public playlist-modify-private user-library-read user-library-modify'
end
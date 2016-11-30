class Location < ActiveRecord::Base
  belongs_to :user
  has_many :musics
  
  def Location.get_by_distance(location, distance)
    Location.find_by_sql("SELECT * FROM locations WHERE (3956 * 2 * ASIN(SQRT(POWER(
      SIN((abs(#{location.latitude}) - abs(latitude)) 
      * pi()/180 / 2),2) 
      + COS(#{location.latitude} * pi()/180 ) 
      * COS( abs(latitude) *  pi()/180) 
      * POWER(SIN((#{location.longitude} - longitude) 
      *  pi()/180 / 2), 2) ))) < #{distance}")
  end
end

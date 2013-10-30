class ThingToDo < ActiveRecord::Base
  belongs_to :place

  def self.get_all
    self.all.map do |i|
      pl = i.place
      {
        :place_id => pl.id,
        :name => pl.name,
        :address => pl.address,
        :city => pl.city,
        :state => pl.state,
        :phone => pl.phone,
        :lat => pl.lat,
        :lon => pl.lon,
        :age_range => i.age_range
      }
    end
  end

end

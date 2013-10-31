class Visit < ActiveRecord::Base
  belongs_to :place

  def self.get_all
    self.all.map do |i|
      pl = i.place
      {
        :id => i.id,
        :place_id => pl.id,
        :name => pl.name,
        :address => pl.address,
        :city => pl.city,
        :state => pl.state,
        :phone => pl.phone,
        :lat => pl.lat,
        :lon => pl.lon,
        :day_number => i.day_number,
        :place_type => i.place_type,
        :visit_order => i.visit_order
      }
    end
  end

end

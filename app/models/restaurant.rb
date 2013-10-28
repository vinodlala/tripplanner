class Restaurant < ActiveRecord::Base
  belongs_to :place

  def self.get_all
    # @restaurants = Restaurant.all
    self.all.map do |i|
      pl = i.place
      {
        :name => pl.name,
        :address => pl.address,
        :city => pl.city,
        :state => pl.state,
        :phone => pl.phone,
        :lat => pl.lat,
        :lon => pl.lon,
        :cuisine => i.cuisine,
        :price => i.price
      }
    end
  end

end

class Place < ActiveRecord::Base
  has_many :hotels
  has_many :thing_to_dos
  has_many :restaurants

  def self.get_all
    self.all.map do |i|
      # pl = i.place
      {
        :name => i.name,
        :address => i.address,
        :city => i.city,
        :state => i.state,
        :phone => i.phone,
        :lat => i.lat,
        :lon => i.lon
      }
    end
  end

end

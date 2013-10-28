class Place < ActiveRecord::Base
  has_many :hotels
  has_many :thing_to_dos
  has_many :restaurants
end

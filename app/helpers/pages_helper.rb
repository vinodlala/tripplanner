module PagesHelper
end

def get_hotels
  Hotel.get_all.to_json.html_safe
end

def get_restaurants
  Restaurant.get_all.to_json.html_safe
end

def get_thingstodo
  ThingToDo.get_all.to_json.html_safe
end

# The following line goes in the script of index.html.erb in views/pages
# var day_visits = <%= get_day %>;
def get_day
  ret_hash = {
    :hotels => [],
    :restaurants => [],
    :thingstodo => []
  }

  day_visits = Visit.get_all
  # day_visits = Visit.where(:day_number => 1)
  # day_visits = Visit.includes(:place).where(:day_number => 1)
  # day_visits = Visit.includes(:place).where(:day_number => params[:day_number])

  day_visits.each do |visit|
    case visit.place_type
    when "hotel"
      hotel = Hotel.where(:place_id => 1)
      # hotel = Hotel.where(:place_id => visit.place_id)
      mashed_hash = visit.attributes.
                          merge(visit.place.attributes).
                          merge(hotel.attributes)
      ret_hash[:hotels] << mashed_hash
    when "restaurant"
      restaurant = Restaurant.where(:place_id => visit.place_id)
      mashed_hash = visit.attributes.
                          merge(visit.place.attributes).
                          merge(restaurant.attributes)
      ret_hash[:restaurants] << mashed_hash
    when "thingtodo"
      thingtodo = ThingToDo.where(:place_id => visit.place_id)
      mashed_hash = visit.attributes.
                          merge(visit.place.attributes).
                          merge(thingtodo.attributes)
      ret_hash[:thingstodo] << mashed_hash
    end
  end

  # render :json => ret_hash
  ret_hash.to_json.html_safe

end

# modified Nimit's code so the array visits_by_days[0] is empty,
# the array visits_by_days[1] has hash for first day only,
# the array visits_by_days[2] has hash for second day only, etc.
def get_all_visits_by_day
  visits_by_days = []
  all_days = Visit.select("distinct day_number as day").order("day ASC")

  prev_day = 0

# the array visits_by_days[0] (this is the first hash) should be empty
# first days' hash should be array[1], not array[0]
  # ret_hash = {
  #   :hotels => [],
  #   :restaurants => [],
  #   :thingstodo => []
  # }
  ret_hash = {}
  visits_by_days << ret_hash

  all_days.each do |result|
    day = result.day
    day_visits = Visit.includes(:place).where(:day_number => day.to_i)

    ret_hash = {
      :hotels => [],
      :restaurants => [],
      :thingstodo => []
    }

    day_visits.each do |visit|
      case visit.place_type
      when "hotel"
        hotel = Hotel.where(:place_id => 1).first
        # hotel = Hotel.where(:place_id => visit.place_id)
        mashed_hash = visit.attributes.
                            merge(visit.place.attributes).
                            merge(hotel.attributes)
        ret_hash[:hotels] << mashed_hash
      when "restaurant"
        restaurant = Restaurant.where(:place_id => visit.place_id).first
        mashed_hash = visit.attributes.
                            merge(visit.place.attributes).
                            merge(restaurant.attributes)
        ret_hash[:restaurants] << mashed_hash
      when "thingtodo"
        thingtodo = ThingToDo.where(:place_id => visit.place_id).first
        mashed_hash = visit.attributes.
                            merge(visit.place.attributes).
                            merge(thingtodo.attributes)
        ret_hash[:thingstodo] << mashed_hash
      end
    end
    visits_by_days << ret_hash
  end
  visits_by_days.to_json.html_safe
end

# Nimit's hipchatted code that returns a hash for each visit (each place to go to)
# def get_all_visits_by_day
#   visits_by_days = []
#   all_days = Visit.select("distinct day_number as day").order("day ASC")

#   all_days.each do |result|
#     day = result.day
#     day_visits = Visit.includes(:place).where(:day_number => day.to_i)

#     day_visits.each do |visit|
#       ret_hash = {
#         :hotels => [],
#         :restaurants => [],
#         :thingstodo => []
#       }

#       case visit.place_type
#       when "hotel"
#         hotel = Hotel.where(:place_id => 1).first
#         # hotel = Hotel.where(:place_id => visit.place_id)
#         mashed_hash = visit.attributes.
#                             merge(visit.place.attributes).
#                             merge(hotel.attributes)
#         ret_hash[:hotels] << mashed_hash
#       when "restaurant"
#         restaurant = Restaurant.where(:place_id => visit.place_id).first
#         mashed_hash = visit.attributes.
#                             merge(visit.place.attributes).
#                             merge(restaurant.attributes)
#         ret_hash[:restaurants] << mashed_hash
#       when "thingtodo"
#         thingtodo = ThingToDo.where(:place_id => visit.place_id).first
#         mashed_hash = visit.attributes.
#                             merge(visit.place.attributes).
#                             merge(thingtodo.attributes)
#         ret_hash[:thingstodo] << mashed_hash
#       end

#       visits_by_days << ret_hash
#     end
#   end
#   visits_by_days.to_json.html_safe
# end

def get_all_visits_json
  ret_hash = {
    :hotels => [],
    :restaurants => [],
    :thingstodo => []
  }


  all_visits = Visit.includes(:place).all

  all_visits.each do |visit|
    case visit.place_type
    when "hotel"
      hotel = Hotel.where(:place_id => visit.place_id).first
      mashed_hash = visit.attributes.
                          merge(visit.place.attributes).
                          merge(hotel.attributes)
      ret_hash[:hotels] << mashed_hash
    when "restaurant"
      restaurant = Restaurant.where(:place_id => visit.place_id).first
      mashed_hash = visit.attributes.
                          merge(visit.place.attributes).
                          merge(restaurant.attributes)
      ret_hash[:restaurants] << mashed_hash
    when "thingtodo"
      thingtodo = ThingToDo.where(:place_id => visit.place_id).first
      mashed_hash = visit.attributes.
                          merge(visit.place.attributes).
                          merge(thingtodo.attributes)
      ret_hash[:thingstodo] << mashed_hash
    end
  end

  ret_hash.to_json.html_safe
end

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

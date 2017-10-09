class City
  attr_accessor :name
  attr_accessor :coord1
  attr_accessor :coord2

  def initialize(name, coord1, coord2)
    @name = name
    @coord1 = coord1
    @coord2 = coord2
  end
end

  def distance(city1, city2)
    puts "City 1: #{city1.name}, #{city1.coord1}, #{city1.coord2}"
    puts "City 2: #{city2.name}, #{city2.coord1}, #{city2.coord2}"
    Math.hypot(city2.coord1 - city1.coord1, city2.coord2 - city1.coord2)
  end

  def nearest_neighbor(all_cities, current_city)
    temp = [current_city.name]
    puts "This is the temp: #{temp}"
    until all_cities[0].nil?
      next_city = all_cities[-1]
      all_cities.each do |route|
        puts "This is distance 1: #{distance(current_city, next_city)}"
        puts "This is distance 2: #{distance(current_city, route)}"
        if distance(current_city, next_city) > distance(current_city, route)
          next_city = route
        end
      end
      current_city = next_city
      all_cities.delete(next_city)
      temp.push(current_city.name)
    end
    temp
  end

home = City.new("alpine", 0, 0)
city1 = City.new("philly", 3, 7)
city2 = City.new("miami", 67, 10)
city3 = City.new("denver", 4, 5)
city4 = City.new("chicago", 10, 7)
graph = [city1, city2, city3, city4]
trip = nearest_neighbor(graph, home)
puts trip

require_relative 'node'

class Graphs

  attr_accessor :visited_actors

  def initialize
    @visited_actors = Array.new
  end

  def find_kevin_bacon(node)
    films = []
    @visited_actors.push(node)
    node.film_actor_hash.each do |title, actors|
      #search actors within given movie
      actors.each do |actor|
        if actor.name === "Kevin Bacon"
          films.push(title)
          puts title
          return films
        end
      end
      actors.each do |actor|
        puts actor.name
        if !@visited_actors.include?(actor)
          tempFilms = find_kevin_bacon(actor)
          if !tempFilms.empty?
            films.push(title)
            films += tempFilms
          end
        end
      end
    end
    return films
    #check for 6 degrees of separation
    if (films.length <= 6 && films.length > 0) #search films
      puts "The actor is connected to Kevin Bacon through these films: #{films.all}."
    else
      puts "The actor is not connected to Kevin Bacon through 6 degrees of separation."
    end
  end

  #reset visited attribute to false
  def clear_node(node)
    if node != nil
      @visited_actors.clear
    end
  end

end

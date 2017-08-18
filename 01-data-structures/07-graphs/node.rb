class Node
  attr_accessor :name
	attr_accessor :film_actor_hash
  attr_accessor :visited

	def initialize(name)
		@name = name
		@film_actor_hash = Hash.new()
    @visited = false
	end
end

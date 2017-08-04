#!/usr/bin/ruby

puts "hello"

require_relative 'binary_search_tree'

root = Node.new("Lion", 98)
my_movies = BinarySearchTree.new(root)

movie = Node.new("Moana", 96)
my_movies.insert(root, movie)

movie = Node.new("Beasts of No Nation", 91)
my_movies.insert(root, movie)

movie = Node.new("The Invisible Guest", 56)
my_movies.insert(root, movie)

movie = Node.new("The Dark Knight", 94)
my_movies.insert(root, movie)

movie = Node.new("Avatar", 83)
my_movies.insert(root, movie)

movie = Node.new("Inside Out", 97)
my_movies.insert(root, movie)

movie = Node.new("Hunt for the Wilderpeople", 99)
my_movies.insert(root, movie)

movie = Node.new("Okja", 85)
my_movies.insert(root, movie)

movie = Node.new("The Diving Bell and the Butterfly", 95)
my_movies.insert(root, movie)

movie = Node.new("Forrest Gump", 72)
my_movies.insert(root, movie)

movie = Node.new("ET", 90)
my_movies.insert(root, movie)

my_movies.printf

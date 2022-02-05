# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Movie.destroy_all
Person.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model
# TODO!

# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.
# TODO!

#person data
person = Person.new
person.name = "Christopher Nolan"
person.save

person = Person.new
person.name = "Christian Bale"
person.save

person = Person.new
person.name = "Michael Caine"
person.save

person = Person.new
person.name = "Liam Neeson"
person.save

person = Person.new
person.name = "Katie Holmes"
person.save

person = Person.new
person.name = "Gary Oldman"
person.save

person = Person.new
person.name = "Heath Ledger"
person.save

person = Person.new
person.name = "Aaron Eckhart"
person.save

person = Person.new
person.name = "Maggie Gyllenhaal"
person.save

person = Person.new
person.name = "Tom Hardy"
person.save

person = Person.new
person.name = "Joseph Gordon-Levitt"
person.save

person = Person.new
person.name = "Anne Hathaway"
person.save

#movie data
director = Person.where({name: "Christopher Nolan"})[0]

values = { title: "Batman Begins", year: 2005, rating: "PG-13", person_id: director.id }
movie = Movie.new(values)
movie.save

values = { title: "The Dark Knight", year: 2008, rating: "PG-13", person_id: director.id }
movie = Movie.new(values)
movie.save

values = { title: "The Dark Knight Rises", year: 2012, rating: "PG-13", person_id: director.id }
movie = Movie.new(values)
movie.save

#role data
batman_begins = Movie.where({title: "Batman Begins"})[0]
the_dark_knight = Movie.where({title: "The Dark Knight"})[0]
the_dark_night_rises = Movie.where({title: "The Dark Knight Rises"})[0]
christian_bale = Person.where({name: "Christian Bale"})[0]
michael_caine = Person.where({name: "Michael Caine"})[0]
liam_neeson = Person.where({name: "Liam Neeson"})[0]
katie_holmes = Person.where({name: "Katie Holmes"})[0]
gary_oldman = Person.where({name: "Gary Oldman"})[0]
heath_ledger = Person.where({name: "Heath Ledger"})[0]
aaron_eckhart = Person.where({name: "Aaron Eckhart"})[0]
maggie_gyllenhaal = Person.where({name: "Maggie Gyllenhaal"})[0]
tom_hardy = Person.where({name: "Tom Hardy"})[0]
joseph_gordon_levitt = Person.where({name: "Joseph Gordon-Levitt"})[0]
anne_hathaway = Person.where({name: "Anne Hathaway"})[0]

#Batman Begins Roles
values = { movie_id: batman_begins.id, person_id: christian_bale.id, character_name: "Bruce Wayne" }
role = Role.new(values)
role.save

values = { movie_id: batman_begins.id, person_id: michael_caine.id, character_name: "Alfred" }
role = Role.new(values)
role.save

values = { movie_id: batman_begins.id, person_id: liam_neeson.id, character_name: "Ra's Al Ghul" }
role = Role.new(values)
role.save

values = { movie_id: batman_begins.id, person_id: katie_holmes.id, character_name: "Rachel Dawes" }
role = Role.new(values)
role.save

values = { movie_id: batman_begins.id, person_id: gary_oldman.id, character_name: "Commissioner Gordon" }
role = Role.new(values)
role.save

#The Dark Knight Roles
values = { movie_id: the_dark_knight.id, person_id: christian_bale.id, character_name: "Bruce Wayne" }
role = Role.new(values)
role.save

values = { movie_id: the_dark_knight.id, person_id: heath_ledger.id, character_name: "Joker" }
role = Role.new(values)
role.save

values = { movie_id: the_dark_knight.id, person_id: aaron_eckhart.id, character_name: "Harvey Dent" }
role = Role.new(values)
role.save

values = { movie_id: the_dark_knight.id, person_id: michael_caine.id, character_name: "Alfred" }
role = Role.new(values)
role.save

values = { movie_id: the_dark_knight.id, person_id: maggie_gyllenhaal.id, character_name: "Rachel Dawes" }
role = Role.new(values)
role.save

#The Dark Knight Rises Roles

values = { movie_id: the_dark_night_rises.id, person_id: christian_bale.id, character_name: "Bruce Wayne" }
role = Role.new(values)
role.save

values = { movie_id: the_dark_night_rises.id, person_id: gary_oldman.id, character_name: "Commissioner Gordon" }
role = Role.new(values)
role.save

values = { movie_id: the_dark_night_rises.id, person_id: tom_hardy.id, character_name: "Bane" }
role = Role.new(values)
role.save

values = { movie_id: the_dark_night_rises.id, person_id: joseph_gordon_levitt.id, character_name: "John Blake" }
role = Role.new(values)
role.save

values = { movie_id: the_dark_night_rises.id, person_id: anne_hathaway.id, character_name: "Selina Kyle" }
role = Role.new(values)
role.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie
# TODO!

# Ruby_Project
Hero Academy

#in the terminal

#clear your database
dropdb hero_academy

#create your database
createdb hero_academy

#when in the hero academy folder

#assign the location to the database
psql -d hero_academy -f db/academy.sql

#run the seeds
ruby db/seeds.rb

#to start running the connection
ruby app.rb

#in your browser url go to 
#http://localhost:4567

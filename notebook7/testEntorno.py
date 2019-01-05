#test entorno python

import pymongo
from pymongo import MongoClient

client = MongoClient('localhost', 27017)

db = client['nb7-peliculas']
#1
text = db.movieDetails.find().count()
#2
text = db.movieDetails.find({},{"title":1,"year":1})
#3
text = db.movieDetails.find({year:{"$lte":2000,"$gte":2000}}).pretty()
#4
text = db.movieDetails.find({"awards.wins":{"$gt":5}},{"title":1}).pretty()
#5
text = db.movieDetails.aggregate([{$group:{_id:1,avg_IMDB:{$avg:"$imdb.rating"}}}])
#6
text = db.movieDetails.find({"actors":{$all:["Nicolas Cage"]}},{"title":1}).pretty()
#7
text = db.movieDetails.aggregate([{$group:{"_id":"$year",count:{$sum:1}}}])
#8
text = db.movieDetails.find({},{"title":1}).sort({"tomato.rating":-1}).limit(1).pretty()
#9
text = db.movieDetails.find({genres:{$in:["Thriller"]},"tomato.rating":{$gte:6}},{_id:0,title:1}).pretty()
#10
text = db.movieDetails.distinct("genres")
#11
text = db.movieDetails.find({"plot":{$regex:/Star/}},{"_id":0,"title":1})
#12
text = db.movieDetails.find({"title":{$regex:/^T/}},{"_id":0,"title":1})
#13
text = db.movieDetails.find({genres:{$nin:["Drama","Thriller"]}},{"_id":0,"title":1})
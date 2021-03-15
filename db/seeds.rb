# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

title1 = 'Mission Impossible : Fallout'
text1 = 'Tom Cruise as done one of the best casting in his career'
image1 = 'MI6.jpg'

title2 = 'Indiana Jones: Crystal Skulls'
text2 = 'Harrison Ford left us in awe with that movie'
image2 = 'Indiana_Jones.jpg'

title3 = 'Star Trek Discovery : Commander Burnahm'
text3 = 'One of the best series with a black female actress'
image3 = 'Star_Trek.jpg'

title4 = 'Joker : The real story'
text4 = 'This is another side of the story of the Joker'
image4 = 'Joker.jpg'

Category.create(name: 'Action', priority: 1)
Category.create(name: 'Adventure', priority: 2)
Category.create(name: 'Sci-Fi', priority: 3)
Category.create(name: 'Thriller', priority: 4)

User.create(name: 'Denis')

User.first.articles.build(category_id: Category.find(1).id, title: title1, text: text1, image: image1).save
User.first.articles.build(category_id: Category.find(2).id, title: title2, text: text2, image: image2).save
User.first.articles.build(category_id: Category.find(3).id, title: title3, text: text3, image: image3).save
User.first.articles.build(category_id: Category.find(4).id, title: title4, text: text4, image: image4).save

User.first.votes.build(article_id: Article.last.id).save

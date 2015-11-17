# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@user = User.create(email: "test@test.com", password:"password")
@decks = Deck.create([
  {title: "testdeck", user: @user},
  {title: "sampledeck", user: @user}
  ])

@cards = Card.create([
  {question: "question1", answer: "answer1", deck: @decks[0]},
  {question: "question1", answer: "answer1", deck: @decks[1]}
  ])

@subjects = Subject.create([
  {topic: "sports"},
  {topic: "philosophy"}
  ])

#@decks[0].subjects[0] = @subjects[0]
#@decks[0].save
#@decks[0].subjects[1] = @subjects[1]
#@decks[0].save

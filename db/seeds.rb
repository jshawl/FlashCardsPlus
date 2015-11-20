# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@user = User.create(email: "test@test.com", password:"password")
@decks = Deck.create([
  {title: "Protagonists", user_id: @user.id, last_touched: DateTime.parse("09/01/2015"), published: true},
  {title: "Funny Movie Quotes", user_id: @user.id, last_touched: DateTime.parse("09/01/2015"), published: true},
  {title: "Spanish Anatomy", user_id: @user.id, last_touched: DateTime.parse("09/01/2015"), published: false}
  ])

@cards = Card.create([
  {question: "Hiro Protagonist", answer: "Snow Crash by Neal Stephenson", deck: @decks[0]},
  {question: "Martin the Warrior", answer: "Redwall by Brian Jacques", deck: @decks[0]},
  {question: "Holden Caufield", answer: "The Catcher in the Rye by J.D. Salinger", deck: @decks[0]},
  {question: "Hester Prynne", answer: "The Scarlet Letter by Nathaniel Hawthorne", deck: @decks[0]},
  {question: "Howard Roark", answer: "The Fountainhead by Ayn Rand", deck: @decks[0]},
  {question: "Shadow Moon", answer: "American Gods by Neil Gaiman", deck: @decks[0]},
  {question: "Ged", answer: "A wizard of Earthsea by Ursula K. Le Guin", deck: @decks[0]},
  {question: "Michael Valentine Smith", answer: "Stranger in a Strange Land by Robert A. Heinlein", deck: @decks[0]},
  {question: "Bathsheba Everdene", answer: "Far From the Maddening Crowd", deck: @decks[0]},
  {question: "Leopold Bloom", answer: "Ulysses by James Joyce", deck: @decks[0]},
  {question: "Henry Dorsett Case", answer: "Neuromancer by William Gibson", deck: @decks[0]},
  {question: "Rick Deckard", answer: "Philip K. Dick", deck: @decks[0]},

  {question: "I did absolutely nothing, and it was everything that I thought it could be.", answer: "Office Space", deck: @decks[1]},
  {question: "Gentlemen, you can't fight in here! This is the War Room.", answer: "Dr. Strangelove: Or, How I Learned to Stop Worrying and Love the Bomb (1964)", deck: @decks[1]},
  {question: "Fat, drunk, and stupid is no way to go through life, son.", answer: "Animal House", deck: @decks[1]},
  {question: "They're not gonna catch us. We're on a mission from God.", answer: "The Blues Brothers", deck: @decks[1]},
  {question: "If I'm not back in five minutes, just wait longer.", answer: "Ace Ventura: Pet Detective", deck: @decks[1]},
  {question: "That rug really tied the room together", answer: "The Big Lebowski", deck: @decks[1]},
  {question: "I don't know if you know this, but I'm kind of a big deal.", answer: "Anchorman", deck: @decks[1]},
  {question: "What does 'high score' mean? New high score, is that bad? What does that mean? Did I break it?", answer: "Grandma's Boy", deck: @decks[1]},
  ])


#@decks[0].subjects[0] = @subjects[0]
#@decks[0].save
#@decks[0].subjects[1] = @subjects[1]
#@decks[0].save

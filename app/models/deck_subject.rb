class DeckSubject < ActiveRecord::Base
  belongs_to :deck
  belongs_to :subject
end

class Card < ActiveRecord::Base
  belongs_to :deck
  require 'csv'

  def self.import(file, deck_id)
    # awesome feature!
    CSV.foreach(file.path,headers: true) do |row|
      @temp = Card.new row.to_hash
      # question: why not make this a model method on Deck?
      @temp.deck_id = deck_id ## ^^
      @temp.save
    end
  end
end

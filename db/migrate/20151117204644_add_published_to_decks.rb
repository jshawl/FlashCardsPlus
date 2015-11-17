class AddPublishedToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :published, :boolean
  end
end

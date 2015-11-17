class CreateDecksSubjects < ActiveRecord::Migration
  def change
    create_table :decks_subjects, :id => false do |t|
    t.references :deck
    t.references :subject

    t.timestamps null: false
    end
  end
end

class CreateJoinTableDeckSubject < ActiveRecord::Migration
  def change
    create_join_table :decks, :subjects do |t|
      # t.index [:deck_id, :subject_id]
      # t.index [:subject_id, :deck_id]
    end
  end
end

class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :topic, unique: true

      t.timestamps null: false
    end
  end
end

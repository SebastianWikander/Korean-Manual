class CreateFlashcards < ActiveRecord::Migration
  def change
    create_table :flashcards do |t|
      t.references :user
      t.references :word
      t.integer :level

      t.timestamps
    end
  end
end

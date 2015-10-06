class CreateExampleSentenceWords < ActiveRecord::Migration
  def change
    create_table :example_sentence_words do |t|
      t.references :word
      t.references :example_sentence

      t.timestamps
    end
  end
end

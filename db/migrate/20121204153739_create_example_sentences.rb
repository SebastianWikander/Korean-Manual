class CreateExampleSentences < ActiveRecord::Migration
  def change
    create_table :example_sentences do |t|
      t.string :korean
      t.string :english

      t.timestamps
    end
  end
end

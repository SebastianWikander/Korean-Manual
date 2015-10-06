class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.references :word
      t.string :english

      t.timestamps
    end
    add_index :translations, :word_id
  end
end

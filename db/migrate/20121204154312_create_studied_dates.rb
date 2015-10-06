class CreateStudiedDates < ActiveRecord::Migration
  def change
    create_table :studied_dates do |t|
      t.references :flashcard
      t.timestamp :date

      t.timestamps
    end
  end
end

# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121207064325) do

  create_table "example_sentence_words", :force => true do |t|
    t.integer  "word_id"
    t.integer  "example_sentence_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "example_sentences", :force => true do |t|
    t.string   "korean"
    t.string   "english"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "flashcards", :force => true do |t|
    t.integer  "user_id"
    t.integer  "word_id"
    t.integer  "level"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "studied_dates", :force => true do |t|
    t.integer  "flashcard_id"
    t.datetime "date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "translations", :force => true do |t|
    t.integer  "word_id"
    t.string   "english"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "translations", ["word_id"], :name => "index_translations_on_word_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "words", :force => true do |t|
    t.string   "korean"
    t.string   "english"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end

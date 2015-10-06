#!/bin/env ruby
# encoding: utf-8

require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_words
    make_example_sentences
    make_relations
  end
end

def make_users
  User.create!(:name => 'Example',
               :email => 'example@gmail.com')
  10.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@gmail.com"
    User.create!(:name => name,
                 :email => email)
  end
end  

def make_words
  Word.create!(:korean => '한국어')
  Word.last.translations.create!(:english => 'Korean')
  Word.last.translations.create!(:english => 'The korean language')
  Word.create!(:korean => '한국')
  Word.last.translations.create!(:english => 'Korea')
  Word.create!(:korean => '하다')
  Word.last.translations.create!(:english => 'To do')
end

def make_example_sentences
  word = Word.first
  word.example_sentences.create!(:korean => '한국어 못해',
                          :english => 'I can\'t speak korean.')
  word.example_sentences.create!(:korean => '나는 한국어를 말하고싶어',
                          :english => 'I want to speak korean.')
  word.example_sentences.create!(:korean => '나는 한국어를 공부하고 있어 ',
                          :english => 'I\'m studying korean.')
end

def make_relations
  Word.all(:limit => 5).each do |word|
    User.all(:limit => 5).each do |user|
      level = 1
      user.flashcards.create!(:word_id => word.id, :level => level)
    end
  end
end

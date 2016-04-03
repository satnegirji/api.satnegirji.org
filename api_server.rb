
require 'json'
require 'sinatra'
require 'sanitize'
require "sinatra/activerecord"
require 'language'
#require "./lib/language/accent"
require "./models/word"
require "./models/translation"

# ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')


get '/search' do
  headers 'Access-Control-Allow-Origin' => '*'
  query = params[:query]
  words = Word.where("keyword LIKE ?", "%#{Language::Accent.strip(Sanitize.clean(query))}%").limit(50)
  content_type :json
  if words
    {
      results: words.map { |w| { id: w.id, body: w.body, language: w.language, word_class: w.word_class }}
    }.to_json
  else
    status 404
  end
end

get '/word' do
  headers 'Access-Control-Allow-Origin' => '*'
  content_type :json
  word = Word.find( Sanitize.clean(params[:id]))
  if word
    word.as_json
  else
    # HTTP Not Found
    status 404
  end
end

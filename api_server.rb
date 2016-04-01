
require 'json'
require 'sinatra'
require 'sanitize'
require "sinatra/activerecord"
require "./lib/language/accent"

configuration do
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
end

get '/search/:query' do |query|
  headers 'Access-Control-Allow-Origin' => '*'
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

get '/word/:id' do |id|
  headers 'Access-Control-Allow-Origin' => '*'
  content_type :json
  word = Word.find( Sanitize.clean(id))
  if word
    word.as_json
  else
    # HTTP Not Found
    status 404
  end
end

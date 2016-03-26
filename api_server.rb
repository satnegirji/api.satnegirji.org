
require 'json'
require 'sinatra'
require 'sanitize'

get '/search' do
  query = Sanitize.clean(params[:query])
  headers 'Access-Control-Allow-Origin' => '*'
  content_type :json
  {
    results: [
      { id: 123123, body: "beana", language: "northern sami" },
      { id: 54363,  body: "begin", language: "english" },
      { id: 54362,  body: "beduiini", language: "finnish" },
      { id: 54361,  body: "bensin", language: "english" },
      { id: 52041,  body: "bensiini", language: "finnish" },
    ]
  }.to_json
end

get '/word/:id' do
  query = Sanitize.clean(params[:id])
  headers 'Access-Control-Allow-Origin' => '*'
  content_type :json
  {
    word: { id: 123123, body: "beana", language: "northern sami" },
    translations: [
      { id: 54363,  body: "koira", language: "finnish" },
      { id: 54363,  body: "hauva", language: "finnish" },
      { id: 32567,  body: "piski", language: "finnish" },
      { id: 1243,  body: "dog", language: "english" },
      { id: 23455,  body: "hound", language: "english" },
      { id: 3432,  body: "hund", language: "swedish" }
    ]
  }.to_json
end

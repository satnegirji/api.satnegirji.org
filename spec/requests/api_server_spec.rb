require_relative '../spec_helper'

describe "API Server" do


  def create_defaults!
    Word.delete_all
    Translation.delete_all
    beana = Word.create!( id: 0, body: "beana", keyword: "beana", language_id: Language.find_by_code("northern_sami"))
    dog = Word.create!( id: 1, body: "dog", keyword: "dog", language_id: Language.find_by_code("english"))
    koira = Word.create!( id: 2, body: "koira", keyword: "koira", language_id: Language.find_by_code("finnish"))
    Word.create!( id: 3, body: "begin", keyword: "begin", language_id: Language.find_by_code("english"))
    Word.create!( id: 4, body: "beduiini", keyword: "beduiini", language_id: Language.find_by_code("finnish"))
    Translation.create!(id: 0, original: beana, translated: dog)
    Translation.create!(id: 1, original: dog, translated: beana)
    Translation.create!(id: 2, original: beana, translated: koira)
    Translation.create!(id: 3, original: koira, translated: beana)
  end

  describe "GET word?id=:id" do

    it "should return correct JSON" do

      create_defaults!
      # expect

      # GET word/0

      get '/word?id=0'
      response = JSON.parse(last_response.body, symbolize_names: true)
      expected = {
        id: 0,
        body: "beana",
        language: "northern_sami",
        word_class: "undefined",
        translations: [
          {
            id: 1,
            body: "dog",
            word_class: "undefined",
            language: "english"
          },
          {
            id: 2,
            body: "koira",
            word_class: "undefined",
            language: "finnish"
          }
        ]
      }
      response.must_equal expected
    end

  end

  describe "GET search?query=:query" do
    it "should return translations when querying a valid word" do
      create_defaults!
      expected = {
                    results: [
                      { id: 0, body: "beana", language: "northern_sami",word_class: "undefined" },
                      { id: 3, body: "begin", language: "english", word_class: "undefined" },
                      { id: 4, body: "beduiini", language: "finnish", word_class: "undefined" }
                    ]
                  }
      get "/search?query=be"
      response = JSON.parse(last_response.body, symbolize_names: true)
      response.must_equal expected
    end


    # GET search/beana


  end

end

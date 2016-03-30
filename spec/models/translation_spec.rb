require_relative '../spec_helper'

describe Translation do
  it "should prevent creating duplicates within the scopes of original and translation" do
    Translation.delete_all
    Translation.create( original_id: 0, translation_id: 0 )
    Translation.create( original_id: 1, translation_id: 0 )
    Translation.create( original_id: 1, translation_id: 1 )
    Translation.create( original_id: 0, translation_id: 1 )

    Translation.count.must_equal 4
    Translation.create( original_id: 0, translation_id: 0 ).valid?.must_equal false
    Translation.create( original_id: 0, translation_id: 1 ).valid?.must_equal false
    Translation.count.must_equal 4
  end

  it "links original and translated word" do
    Translation.delete_all
    Word.delete_all

    #FIX: mock this
    beana = Word.create!( id: 1, body: "beana", keyword: "beana", language_id: Language.find_by_code("northern_sami"))
    dog = Word.create!( id: 2, body: "dog", keyword: "dog", language_id: Language.find_by_code("english"))

    translation = Translation.create!( id: 1, original: beana, translated: dog)
    translation = Translation.create!( id: 2, original: dog, translated: beana)

    #FIX: these following lines have nothing to do with Translation class
    beana.reload

    beana.translations.first.translated.must_equal dog
    dog.translations.first.translated.must_equal beana

  end
end

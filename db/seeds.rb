require_relative "../lib/language"
require_relative "../models/word"
require_relative "../models/translation"


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
puts "Words: #{Word.count}"
puts "Translations: #{Translation.count}"

class Word < ActiveRecord::Base
  validates :body, presence: true
  validates :keyword, presence: true
  validates :language_id, presence: true
  has_many :translations, foreign_key: "original_id"

  def language
    Language.find( self[:language_id] )
  end

  def as_json(options = {})
    {
      id: id,
      body: body,
      language: language,
      translations: translations.map {|t| {id: t.translated.id, body: t.translated.body, language: Language.find(t.translated.language_id)} }
    }.to_json
  end
end

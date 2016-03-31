module Language
  module WordClass
    # A part of speech (abbreviated form: PoS or POS) is a category of words
    # (or, more generally, of lexical items) which have similar grammatical
    # properties.
    #
    # Words that are assigned to the same part of speech generally
    # display similar behavior in terms of syntax—they play similar roles
    # within the grammatical structure of sentences—and sometimes in terms of
    # morphology, in that they undergo inflection for similar properties.
    #
    # https://en.wikipedia.org/wiki/Part_of_speech
    #
    WORD_CLASS = {
      0 => "undefined",
      1 => "noun",
      2 => "verb",
      3 => "adjective",
      4 => "adverb",
      5 => "pronoun",
      6 => "preposition",
      7 => "conjunction",
      8 => "determiner",
      9 => "exclamation"
    }

    def self.find(id)
      WORD_CLASS.fetch(id, WORD_CLASS[0])
    end

    def self.find_by_code(code)
      WORD_CLASS.select do |k,v|
        v == code
      end.keys.first
    end
  end
end

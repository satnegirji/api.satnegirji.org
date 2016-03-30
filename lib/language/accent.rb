module Language
  module Accent
    STRIP_ACCENT_LOOKUP = {
      "a": "ÁáÁáÂâÄäÅåÆæ",
      "c": "Čč",
      "d": "Đđ",
      "g": "ǦǧǤǥ",
      "i": "Ïï",
      "n": "ŊŋŃń",
      "k": "Ǩǩ",
      "o": "ÖöÕõØø",
      "s": "Šš",
      "t": "Ŧŧ",
      "z": "ŽžƷʒǮǯ"
    }

    def self.strip(str)
      str.split('').map {|ch| strip_accent_ch(ch) }.join()
    end

    private

    def self.strip_accent_ch(ch)
      STRIP_ACCENT_LOOKUP.each do |key, values|
        return key if values.index(ch)
      end
      ch
    end
  end

end

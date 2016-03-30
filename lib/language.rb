module Language

  LANGUAGES = {
    0 => "northern_sami",
    1 => "inari_sami",
    2 => "skolt_sami",
    3 => "lule_sami",
    4 => "southern_sami",
    5 => "kildin_sami",
    6 => "pite_sami",
    7 => "ume_sami",
    8 => "akkala_sami",
    9 => "kemi_sami",
    10 => "kainuu_sami",
    11 => "ter_sami",
    100 => "english",
    101 => "finnish"
  }

  def self.find(id)
    LANGUAGES.fetch(id)
  end

  def self.find_by_code(code)
    LANGUAGES.select do |k,v|
      v == code
    end.keys.first
  end

  def self.all
    LANGUAGES
  end
end

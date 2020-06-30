require "yaml"
require "pry"


def load_library(yaml_file)
  loadlib =YAML.load_file(yaml_file)
  get_meaning  = {}
  get_emoticon = {}
  
  loadlib.each do |meaning, vray|
    english_emoticon = vray[0] 
    japanese_emoticon = vray[1]
    get_meaning[meaning] = {english: english_emoticon, japanese: japanese_emoticon}
    get_emoticon[vray[0]] = vray[1]
  end
  get_meaning
  #binding.pry
end

def get_japanese_emoticon(yaml_file, eng_emoti)
  j_emoti = ""
  library = load_library(yaml_file)
  library.each do |meaning, langs|
    langs.each do |in_key, emoti|
      if emoti == eng_emoti
        j_emoti = langs[:japanese]
      end 
    end
    if j_emoti == ""
        j_emoti = "Sorry, that emoticon was not found"
    end
  end 
  j_emoti
  #binding.pry
end

def get_english_meaning(yaml_file, j_emoticons)
  english_meaning = ""
  sorry = "Sorry, that emoticon was not found"
  library = load_library(yaml_file)
  library.each do |meaning, langs|
    langs.each do |in_key, emoti|
      if emoti == j_emoticons
        english_meaning = meaning
      end 
    end
    if english_meaning == ""
      english_meaning = sorry
    end 
  end
  english_meaning
  #binding.pry 
end
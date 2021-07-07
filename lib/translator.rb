require "yaml"
require 'pry'

def load_library(emoticon_file)
  emoticons = YAML.load_file('./lib/emoticons.yml')

  new_hash = Hash.new

  emoticons.each do |meaning, value|
    new_hash[meaning] ||= {}
    new_hash[meaning][:english] = value[0]
    new_hash[meaning][:japanese] =  value[1]
    #binding.pry
  end
  new_hash
end

def get_japanese_emoticon(emoticons, eng_emo)
  library = load_library('./lib/emoticons.yml')
  library.each do |meaning, idioms|
    return idioms[:japanese] if idioms[:english] == eng_emo
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(emoticons, jap_emo)
  library = load_library('./lib/emoticons.yml')
  library.each do |meaning, idioms|
    return meaning if idioms[:japanese] == jap_emo
  end
    "Sorry, that emoticon was not found"
end
#binding.pry

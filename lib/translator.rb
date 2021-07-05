# require modules here
require "yaml"
require "pry"

data = YAML.load_file('./lib/emoticons.yml')

def load_library(data = YAML.load_file('./lib/emoticons.yml'))
  data = YAML.load_file('./lib/emoticons.yml')
  emoticon_hash = {}

  data.each do |meaning, emoticon|
    eng = emoticon[0]
    jap = emoticon[1]

    emoticon_hash[meaning] = {
      :english => eng,
      :japanese => jap
    }
  end
  emoticon_hash
end

def get_japanese_emoticon(data = YAML.load_file('./lib/emoticons.yml'), emoticon)
  data = load_library(data) 
  data.each do |meaning, languages|
    if languages[:english] == emoticon
      return languages[:japanese]
    end
  end 
  "Sorry, that emoticon was not found"
end

def get_english_meaning(data, j_emoticon)
  emoticons = load_library(data)
  eng_meaning = ""
  apology = "Sorry, that emoticon was not found"
  emoticons.each do |emotion, lang|
    lang.each do |inner_key,emoticon|
      if emoticon == j_emoticon
        eng_meaning = emotion
      end
    end
    if eng_meaning == ""
      eng_meaning = apology
    end  
  end
  eng_meaning
  
end
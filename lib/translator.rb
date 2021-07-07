# require modules here
require "yaml"
require "pry"

def load_library(file_path)
  # code goes here
  emoticons_hash = YAML.load_file(file_path)
  final_emoticon_hash={}
  
  emoticons_hash.each do |emotion_word, faces|
    final_emoticon_hash[emotion_word]={}
      final_emoticon_hash[emotion_word][:english]=faces[0]
      final_emoticon_hash[emotion_word][:japanese]=faces[1]
  end
  final_emoticon_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  library=load_library(file_path)
  library.map do |word, translations|
    if translations[:english]==emoticon
      return translations[:japanese]
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  library=load_library(file_path)
  library.map do |word, translations|
    if translations[:japanese]==emoticon
      return word
    end
  end
  "Sorry, that emoticon was not found"
end
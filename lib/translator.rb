require 'yaml'
require 'pry'


def load_library(learn)
  emoticons=YAML.load_file(learn)
  emoticons.each do |face, emoticon|
    emoticons[face]={:english => "", :japanese => ""}
    emoticons[face][:english]=emoticon[0]
    emoticons[face][:japanese]=emoticon[1]
  
  end
  emoticons
end

def get_japanese_emoticon(file, emoticon)
  emoticons= load_library(file)
  emoticons.each do |face, meaning|
    if meaning[:english]==emoticon
      return meaning[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  emoticons= load_library(file)
  emoticons.each do |face, meaning|
    if meaning[:japanese]==emoticon
      return face
    end
  end
  return "Sorry, that emoticon was not found"
end
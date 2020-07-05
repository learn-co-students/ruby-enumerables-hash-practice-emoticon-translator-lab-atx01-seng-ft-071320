# require modules here
require "yaml"
require "pry"

=begin
def load_library(file)
  # code goes here
emoticons = YAML.load_file(file)
return_hash = {"get_meaning" => {}, "get_emoticons" => {}}
#binding.pry
emoticons.each do |key, value|
  return_hash["get_emoticons"][value[0]] = emoticons[key][1]
  return_hash["get_meaning"][value[1]] = key
  #binding.pry
end
return_hash
end
=end
def load_library(file)
emoticon = YAML.load_file(file)
  emot_hash = {}
  emoticon.each do |key, value|
    emot_hash[key] = {}
    emot_hash[key][:english] = value[0]
    emot_hash[key][:japanese] = value[1]

  end
emot_hash
end

def get_japanese_emoticon (file, e_meaning)
  # code goes here
  sorry_message = "Sorry, that emoticon was not found"
  lib = load_library(file)
  #binding.pry
    e_meaning = lib.keys.find do |key|
      #binding.pry
     lib[key][:english] == e_meaning

      #binding.pry
  end
    e_meaning ? lib[e_meaning][:japanese] : sorry_message
end

def get_english_meaning (file, j_meaning)
  # code goes here
#binding.pry
sorry_message = "Sorry, that emoticon was not found"
lib = load_library(file)
#binding.pry
  j_meaning = lib.keys.find do |key|
    #binding.pry
   lib[key][:japanese] == j_meaning

    #binding.pry
end
  j_meaning ? j_meaning : sorry_message
     #binding.pry
    end

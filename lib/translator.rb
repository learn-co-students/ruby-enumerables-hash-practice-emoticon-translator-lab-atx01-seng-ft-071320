# require modules here
require "yaml"
require "pry"


#pre: a yaml file is listing emoticons
#post: a hash has been modified where arrays of data have become the info for a new hash nested within the original 

#finalHash = original hash << new_hash 

#new_hash = :english => "value[0]",
#           :japanese => "value[1]"
                        
def load_library(file_path)

emoticons_hash = YAML.load_file(file_path)

final_hash = {}

 #access a key(faces) of an emotion 
  emoticons_hash.each do |emotion_word, faces|
    final_hash[emotion_word] = {}
        final_hash[emotion_word][:english] = faces[0]
        final_hash[emotion_word][:japanese] = faces[1]
        
end 
final_hash #return new hash
end


#same logic as the english meaning method just return a #diffrent value as apposed to a key

#pre:given an argument of a emoticon (in english)
#post: using the emoticon library access the japanese #version

def get_japanese_emoticon(file_path, emoticon)
   library = load_library(file_path)
   library.map do |word, translations| 
     if translations[:english] == emoticon
      return translations[:japanese] 
    end

end
"Sorry, that emoticon was not found"
end



#if the emoticon is equal to the value of the translation send back the key(word)

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  library.each do |word, translations|
    #binding.pry
    if translations[:japanese] == emoticon
      return word
    end
  end
"Sorry, that emoticon was not found"
end


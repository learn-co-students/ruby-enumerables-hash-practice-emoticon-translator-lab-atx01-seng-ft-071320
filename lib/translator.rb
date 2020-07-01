# require modules here
require "yaml"

def load_library(dir)
  # code goes here
  load_yaml = YAML.load_file(dir)
  load_yaml.each do |key, names|
    if !load_yaml[key] = {}
      load_yaml[key] = {}
    end
    if !load_yaml[key] = {:english => names[0], :japanese => names[1]}
      load_yaml[key] = {:english => names[0], :japanese => names[1]}
    end
  end
    
end

def get_japanese_emoticon(path, e_emoticon)
  translation = ""
  load_library(path).each do |key, lang|
    lang.each do |inner_key, emoticon|
      if e_emoticon == emoticon
        translation = load_library(path)[key][:japanese]
      end
      if translation == ""
        translation = "Sorry, that emoticon was not found"
      end
    end
  end
  translation
end

def get_english_meaning(path, emoticon)
  # code goes here
  meaning = ""
  load_library(path).each do |key, lang|
    lang.each do |inner_key, names|
      if names == emoticon
         meaning = key
      end
      if meaning == ""
        meaning = "Sorry, that emoticon was not found"
      end
    end
  end
  meaning   
end
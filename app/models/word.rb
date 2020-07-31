class Word < ApplicationRecord
  WORDS_LIST_PATH = "#{Rails.public_path}/words.txt"
  
  def self.getFromFile(word_number=nil)
    if !word_number
      word_count = `wc -l "#{WORDS_LIST_PATH}"`.strip.split(' ')[0].to_i
      word_number = rand(1..word_count)
    end

    file = File.open(WORDS_LIST_PATH, 'r')
    line = ''
    line_number = 0


    while line = file.gets do
      line_number += 1
      if (word_number == line_number)
        word = line
        break
      end
    end
    file.close

    return word
  end

end

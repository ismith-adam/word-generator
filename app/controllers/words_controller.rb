class WordsController < ApplicationController

  def index
  end

  def new
    path = "#{Rails.public_path}/words.txt"
    count = `wc -l "#{path}"`.strip.split(' ')[0].to_i
    random_word_number = rand(1..count)
    file = File.open(path, 'r')
    line = ''
    line_number = 0

    while line = file.gets do
      line_number += 1
      if (random_word_number == line_number)
        @word = line
        break
      end
    end
    file.close
    
    render plain: @word
  end
end

class WordsController < ApplicationController

  def index
  end

  def new
    render plain: Word.getFromFile
  end
end

class GamesController < ApplicationController
  def new
    @letters = []
    @letters << ("A".."Z").to_a.sample until @letters.length == 10
  end

  def score
  end
end

require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    @letters << ("A".."Z").to_a.sample until @letters.length == 10
  end

  def score
    @word = params[:word].upcase
    @letter_list = params[:letters]
    # check if in letters
    array = @word.split("")
    match = array.all? {|e| @letter_list.split("").include?(e)}
    # check if in dictionnary
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    data_serialized = URI.open(url).read
    attempt = JSON.parse(data_serialized)
    valid = attempt["found"]
    # send message
    if valid
      @message = "valid"
    elsif match == false
      @message = "no_match"
    end
  end
end

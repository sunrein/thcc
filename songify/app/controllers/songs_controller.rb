include HTTParty

class Songs < ApplicationController
  def new
    # new song
  end

  def create
    # should first search database for exisiting query

    # if the song query has not been searched before, create and save new song query
    # adds 1 to search count
    # if the song query has already been searched before, add one to search count
  end

  def show
    # render 'song'
  end

  def search
    # https://api.spotify.com/v1/search?q=hello&type=track&limit=10
  end

  private

  def song
    Song.find(params[:id])
  end
end

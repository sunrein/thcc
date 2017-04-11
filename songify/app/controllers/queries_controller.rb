require "httparty"

class QueriesController < ApplicationController

  def new
    @query = Query.new
  end

  def create
    @query = Query.find_by(title: query_params[:title])

    if @query.nil?
      @query = Query.create(query_params)

      if @query.save
        search(query_params[:title])
        @query.search_count += 1
        @query.save
        render partial: 'queries/results'
      else
        render template: 'queries/new'
      end
    else
      search(query_params[:title])
      @query.search_count += 1
      @query.save
      render partial: 'queries/results'
    end
  end

  def index
    @queries = Query.all
  end

  def search(title)
    response = HTTParty.get("https://api.spotify.com/v1/search?q=#{title}&type=track&limit=10")

    parsed_response = JSON.parse(response.body)
    @title = parsed_response["tracks"]["items"].first["name"]
    @artist = parsed_response["tracks"]["items"].first["artists"].first["name"]
    @spotify = parsed_response["tracks"]["items"].first["external_urls"]["spotify"]
    #todo: iterate over all items in tracks to parse the data for multiple results
  end

  private

  def query_params
    params.require(:query).permit(:title, :artist, :search_count)
  end
end

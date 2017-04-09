include HTTParty

class QueriesController < ApplicationController
  def new
  end

  def find_or_create
    query = Query.find_by(params[:title])

    if query.nil?
      Query.create(
                  title: params[:title],
                  search_count: 0
      )
    else
      query.search_count += 1
    end
  end

  def index
    queries = Query.all

    # render queries
  end

  def search(params[:title])
    response = HTTParty.get("https://api.spotify.com/v1/search?q=#{params[:title]}&type=track&limit=10")

    JSON.parse(response.body)
  end

  private

  def query_params
    params.require(:song).permit(:title, :artist, :search_count)
  end

  def query
    Query.find(params[:id])
  end
end

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
        @query.search_count += 1
        @query.save
        redirect_to "/"
      else
        render template: 'queries/new'
      end
    else
      search(query_params[:title])
      @query.search_count += 1
      @query.save
      redirect_to "/"
    end
  end
    # query = Query.find_by(params[:title])
    #
    # if query.nil?
    #   Query.create(
    #               title: params[:title],
    #               search_count: 0
    #   )
    # else
    #   query.search_count += 1
    # end

    # search(params[:title])

  def index
    @queries = Query.all
  end

  def search(title)
    response = HTTParty.get("https://api.spotify.com/v1/search?q=#{title}&type=track&limit=10")

    JSON.parse(response.body)
  end

  private

  def query_params
    params.require(:query).permit(:title, :artist, :search_count)
  end
end

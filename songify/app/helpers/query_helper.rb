module QueryHelper
  def existing_query(imdb)
    movie = Movie.find_by(imdb_id: imdb)
    if movie
      movie.id
    else
      false
    end
  end
end

module QueryHelper
  def existing_query(title)
    query = Query.find_by(title: title)
    if query
      query.id
    else
      false
    end
  end
end

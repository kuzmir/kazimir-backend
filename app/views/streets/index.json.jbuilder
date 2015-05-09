json.array! @streets do |s|

  json.id s.id

  json.name s.name
  ## returned as GeoJSON
  json.path do
    json.type "LineString"
    json.coordinates s.path_coordinates
  end
  json.path_string s.path
  json.updated_at s.updated_at

  json.places do

    [:present, :past].each do |t|
      json.set! t do
        json.partial! 'places/place', collection: s.places_by_type(t), as: :place
      end
    end

  end

end

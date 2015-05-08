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

  json.places s.places do |place|
    json.id place.id

    json.details do
      [:en, :pl].each do |lang|
        json.set! lang do
          json.name place["name_#{lang}"]
          json.description place["description_#{lang}"]
        end
      end
    end

    json.update_at place.updated_at

    json.photos place.photos do |photo|
      json.id photo.id

      json.details do
        [:en, :pl].each do |lang|
          json.set! lang do
            json.title photo.title
            json.description photo.description
          end
        end
      end

      json.images do
        json.thumb attachment_url(photo.image, :thumb)
        json.tiny attachment_url(photo.image, :tiny)
        json.small attachment_url(photo.image, :small)
        json.medium attachment_url(photo.image, :medium)
        json.large attachment_url(photo.image, :large)
      end
    end


  end

end

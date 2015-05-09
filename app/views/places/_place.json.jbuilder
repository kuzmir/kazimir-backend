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
json.photos place.photos, partial: 'photos/photo', as: :photo

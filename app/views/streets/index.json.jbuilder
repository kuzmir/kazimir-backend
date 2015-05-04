json.array! @streets do |s|

  json.id s.id

  [:en, :pl].each do |lang|
    json.set! lang do
      json.name s["name_#{lang}"]
      json.description s["description_#{lang}"]
      json.past_description s["past_description_#{lang}"]
    end
  end

  json.path s.path_array
  json.updated_at s.updated_at

  json.places s.places

end

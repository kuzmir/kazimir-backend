json.array! @streets do |s|

  json.id s.id

  json.name s.name
  json.path s.path_array
  json.updated_at s.updated_at

  json.places s.places

end

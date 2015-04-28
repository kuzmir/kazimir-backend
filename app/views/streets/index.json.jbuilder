json.array! @streets do |s|

  json.id s.id
  json.name s.name

  json.description s.description
  json.past_description s.past_description
  json.path s.path_array

  json.places s.places

  json.updated_at s.updated_at
end

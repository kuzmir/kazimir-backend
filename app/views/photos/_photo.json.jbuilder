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
json.updated_at photo.updated_at

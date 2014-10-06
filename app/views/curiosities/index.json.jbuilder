json.array!(@curiosities) do |curiosity|
  json.extract! curiosity, :id, :user_id, :title, :description
  json.url curiosity_url(curiosity, format: :json)
end

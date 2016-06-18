json.array!(@teams) do |team|
  json.extract! team, :id, :title, :description, :team_image
  json.url team_url(team, format: :json)
end

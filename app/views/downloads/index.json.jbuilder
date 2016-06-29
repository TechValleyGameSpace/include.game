json.array!(@downloads) do |download|
  json.extract! download, :id, :name, :submission_id, :platforms
  json.url download_url(download, format: :json)
end

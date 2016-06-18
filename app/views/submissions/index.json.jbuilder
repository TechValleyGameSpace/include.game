json.array!(@submissions) do |submission|
  json.extract! submission, :id, :title, :description, :header_image, :icon_image, :submitted, :updated
  json.url submission_url(submission, format: :json)
end

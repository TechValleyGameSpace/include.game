json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :header_image, :icon_image, :start, :end, :submission_grace_period, :submission_open, :status, :submitted, :updated
  json.url event_url(event, format: :json)
end

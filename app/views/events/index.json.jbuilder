json.array!(@events) do |event|
  json.extract! event, :id, :name, :description, :start, :end, :status
  json.url event_url(event, format: :json)
end

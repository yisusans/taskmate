json.array!(@completions) do |completion|
  json.extract! completion, :id
  json.url completion_url(completion, format: :json)
end

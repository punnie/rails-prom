json.extract! cointoss, :id, :created_at, :updated_at, :parameters
json.result cointoss.formatted_result
json.url cointoss_url(cointoss, format: :json)

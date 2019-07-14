json.extract! diceroll, :id, :created_at, :updated_at, :parameters, :result
json.url diceroll_url(diceroll, format: :json)

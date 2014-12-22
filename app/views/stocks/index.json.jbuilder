json.array!(@stocks) do |stock|
  json.extract! stock, :id, :name, :price, :quantity
  json.url stock_url(stock, format: :json)
end

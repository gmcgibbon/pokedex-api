class ActionDispatch::TestResponse
  def json
    JSON.parse body
  end
end

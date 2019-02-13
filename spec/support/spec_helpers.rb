module RequestSpecHelpers
  def json_response_body
    JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include RequestSpecHelpers, type: :request
end

# Service to call endpoint list tweets
require 'net/http'
class TweetsService
  def list
    uri = URI('http://tweeps.locaweb.com.br/tweeps')
    request = Net::HTTP::Get.new uri.request_uri

    http = Net::HTTP.new(uri.host, uri.port)
    request.initialize_http_header('Username' => 'geschopf@gmail.com')
    http.start
    response = http.request(request)
    return JSON.parse(response.body)
  rescue StandardError => e
    Rails.logger.fatal "Error: TweetsService: #{e}"
  end
end

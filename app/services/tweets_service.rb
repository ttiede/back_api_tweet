# Service to call endpoint list tweets
require 'net/http'
class TweetsService
  
  @uri = URI('http://tweeps.locaweb.com.br/tweeps')
  
  def list
    request =  resquest_tweets_get

    http = Net::HTTP.new(@uri.host, @uri.port)
    request.initialize_http_header('Username' => 'geschopf@gmail.com')
    http.start
    response = http.request(request)
    return JSON.parse(response.body)
  rescue StandardError => e
    Rails.logger.fatal "Error: TweetsService: #{e}"
  end

  def resquest_tweets_get
    Net::HTTP::Get.new @uri.request_uri
  end
end
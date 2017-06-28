# Service to call endpoint list tweets
require 'net/http'
class TweetsService
  def list
    uri = URI('http://tweeps.locaweb.com.br/tweeps')
    request = Net::HTTP::Get.new uri.request_uri

    http = Net::HTTP.new(uri.host, uri.port)
  end
end
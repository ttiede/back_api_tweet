class Tweet
  attr_accessor :screen_name, :followers_count, :retweet_count, :favourites_count, 
  				:text, :created_at, :user_url, :tweet_url

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
end

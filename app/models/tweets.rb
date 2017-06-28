# List of tweets and methods to filters
class Tweets
  attr_reader :all_tweets, :valid_tweets

  def initialize
    @all_tweets = TweetsService.new.list
  end

  def filter
    @all_tweets['statuses'].each do |tweet|
      list_tweets(tweet)
    end
  end

  def list_tweets(tweet)
    tweet['entities']['user_mentions'].each do |mention|
      next unless mention['id'] == 42
      @valid_tweets << tweet(tweet) unless tweet['in_reply_to_user_id'] == 42
    end
  end

end

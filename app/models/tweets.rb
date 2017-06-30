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

  def sorted_by_priority
    @valid_tweets.sort_by do |tweet|
      [tweet.followers_count, tweet.retweet_count, tweet.favourites_count]
    end.reverse
  end

  def most_mentions
    @valid_tweets.group_by(&:screen_name)
  end
  
  protected

  def tweet(tweet)
        Tweet.new(screen_name: tweet['user']['screen_name'].humanize,
              followers_count: tweet['user']['followers_count'],
              retweet_count: tweet['retweet_count'],
              favourites_count: tweet['favourites_count'],
              text: tweet['text'],
              created_at: tweet['created_at'],
              tweet_url: "https://twitter.com/#{tweet['user']['screen_name']}/status/#{tweet['id']}",
              user_url: "http://twitter.com/#{tweet['user']['screen_name']}")
  end
end

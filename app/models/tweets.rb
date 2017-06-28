# List of tweets and methods to filters
class Tweets
  attr_reader :all_tweets

  def initialize
    @all_tweets = TweetsService.new.list
  end

end

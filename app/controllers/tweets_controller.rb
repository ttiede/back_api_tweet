class TweetsController < ApplicationController
  before_action :list_tweet, only: %i[most_mentions most_relevants]

  def most_relevants
    begin
      most_relevants_tweets = @tweets.sorted_by_priority
      process_status = :ok
    rescue StandardError => e
      most_relevants_tweets = "Error: #{e}"
      process_status = :internal_server_error
    end

    render_json(most_relevants_tweets, process_status)
  end

  def most_mentions
    begin
     most_mentions_tweets = @tweets.most_mentions.map { |k, value| { screen_name: k, tweets: value } }
     process_status = :ok
   rescue StandardError => e
     most_mentions_tweets = "Error: #{e}"
     process_status = :internal_server_error
   end
    render_json(most_mentions_tweets, process_status)
  end

  protected

  def list_tweet
    @tweets = Tweets.new(TweetsService.new.list)
    @tweets.filter
    @tweets.sorted_by_priority
  rescue StandardError => e
    render_json("Error: #{e}", :internal_server_error)
  end

  def render_json(payload, status)
    render json: payload, status: status
  end
end

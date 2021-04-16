require 'twitter'
require 'pry-rails'

def get_timeline
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['TWITTER_API_KEY']
    config.consumer_secret     = ENV['TWITTER_API_SECRET_KEY']
    config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
    config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
  end

  timelines = client.user_timeline(1271762668018266112, options = {
    count: 20,
    exclude_replies: true
  })
  timelines.each do |tl|
    puts tl.full_text
    puts "リツイート数：#{tl.retweet_count}"
    puts "いいね数：#{tl.favorite_count}"
    puts "ツイートURL：#{tl.uri}"
  end

end

get_timeline
class TwitterApi

  def self.twitter_config
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_API_KEY']
      config.consumer_secret     = ENV['TWITTER_API_SECRET_KEY']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
    return client
  end

  def self.send_message
    client = twitter_config
    timelines = client.user_timeline(1271762668018266112, options = {
      count: 50,
      exclude_replies: true
    })
    ret_sum = 0
    fav_sum = 0
    timelines.each do |tl|
      ret_sum += tl.retweet_count
      fav_sum += tl.favorite_count
    end

    text = "直近50件のツイートに対する合計リツイート数は#{ret_sum}件、合計いいね数は#{fav_sum}件でした。"
    client.create_direct_message(1271762668018266112, text, options = {})
  end

end
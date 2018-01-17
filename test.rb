  require 'twitter'
  require 'pry'
  require 'dotenv'
  Dotenv.load
  client = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = ENV['CONSUMER_KEY1']
    config.consumer_secret     = ENV['CONSUMER_SECRET1']
    config.access_token        = ENV['ACCESS_TOKEN1']
    config.access_token_secret = ENV['ACCESS_TOKEN_SECRET1']
end

    topics = ["coffee", "tea"]
    client.filter(track: topics.join(",")) do |object|
      puts object.text if object.is_a?(Twitter::Tweet)
    end

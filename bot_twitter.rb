require 'twitter'
require 'pry'
require 'dotenv'
binding.pry
Dotenv.load

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "mykey"
  config.consumer_secret     = "mykey"
  config.access_token        = "mykey"
  config.access_token_secret = "mykey"
end



#client.update('Mon premier tweet en ruby !!!!')
#client.follow("pips166")
#p client






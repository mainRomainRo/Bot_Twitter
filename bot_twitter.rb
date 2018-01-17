require 'twitter'
require 'pry'
require 'dotenv'
Dotenv.load

#Connexion

class Bot_twitter

  def initialize
    begin
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['CONSUMER_KEY2']
        config.consumer_secret     = ENV['CONSUMER_SECRET2']
        config.access_token        = ENV['ACCESS_TOKEN2']
        config.access_token_secret = ENV['ACCESS_TOKEN_SECRET2']
      end
    end

#Fonction envoi d'un message
def messages
  print "Who do you want to send a message to ?: "
  send_message_to = "" + gets.chomp + ""
  print "What do you want to say to #{send_message_to}?: "
  message_content = "" + gets.chomp + ""
  @message = @client.create_direct_message(send_message_to, message_content)
  puts "Message sent"
end


#Streaming de tweet

def streaming
  client = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = ENV['CONSUMER_KEY2']
    config.consumer_secret     = ENV['CONSUMER_SECRET2']
    config.access_token        = ENV['ACCESS_TOKEN2']
    config.access_token_secret = ENV['ACCESS_TOKEN_SECRET2']
  end
  #Issue : Do not stop
  topics = ["coffee", "tea"]
  client.filter(track: topics.join(",")) do |object|

    puts object.text if object.is_a?(Twitter::Tweet)
  end


end
end



end

puts "Bienvenue sur mon bot Twitter"
puts "1 - Envoyer un message"
user_input = gets.chomp.to_i
if user_input == 1
  client = Bot_twitter.new
  client.messages
else
  puts "Ok je ferme le programme"
end



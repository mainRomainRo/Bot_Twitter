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
  puts "Type the id like that: @username"
  send_message_to = "" + gets.chomp + ""
  print "What do you want to say to #{send_message_to}?: "
  message_content = "" + gets.chomp + ""
  @message = @client.create_direct_message(send_message_to, message_content)
  puts "Message sent"
end


#Streaming de tweet

def streaming(tab_keywords)
  client = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = ENV['CONSUMER_KEY2']
    config.consumer_secret     = ENV['CONSUMER_SECRET2']
    config.access_token        = ENV['ACCESS_TOKEN2']
    config.access_token_secret = ENV['ACCESS_TOKEN_SECRET2']
  end
  #Issue : Do not stop
  @topics = tab_keywords
  i = 0
  unless @topics.length == 0
    client.filter(track: @topics.join(",")) do |object|
      i = i+1
      puts object.text if object.is_a?(Twitter::Tweet)
      if i >15
        puts "=========================================================="
        puts "Voila les 15 derniers Tweets en rapport avec tes mots clés"
        puts "=========================================================="
        abort
      end
    end
  else puts "No keywords"
  end
end

end




end

puts "============================="
puts "Bienvenue sur mon bot Twitter"
puts "============================="
puts "1 - Envoyer un message"
puts "2 - Streamer les tweets par mots clés"
puts "3 - Envoyer un message à tout les journalistes"
puts "4 - Liker tous les messages des journalistes"
puts "99 - Quitter le programme"
puts "============================="
user_input = gets.chomp.to_i
if user_input == 1
  client = Bot_twitter.new
  client.messages

elsif user_input == 2

  puts "Par quels mots clé veux-tu streamer ? (presse E pour continuer)"
  user_keywords = gets.chomp.to_s
  tab_keywords =[]
  until user_keywords == "E"
    puts "Quel autre mot clé veux-tu streamer? (presse E pour continuer"
    user_keywords = gets.chomp.to_s
    tab_keywords << user_keywords
  end
  client = Bot_twitter.new
  client.streaming(tab_keywords)
elsif user_input == 3
elsif user_input == 4

elsif user_input == 99
  puts "Ok je ferme le programme"

end



require_relative '../lib/gemini-api-rb.rb'

# Configure the client with the proper KEY/SECRET, you can create a new one from:
# https://api.gemini.com
Gemini::Client.configure do |conf|
  conf.api_key = ENV["GEMINI_KEY"]
  conf.secret  = ENV["GEMINI_SECRET"]
  #conf.debug_connection = true
  # this helper set the API version 2
  conf.use_api_v2
end

# Initialize the client
client = Gemini::Client.new

# Get wallet informations
wallets = client.wallets

wallets.each do |w|
  puts w.join("\t")
end

p client.performance

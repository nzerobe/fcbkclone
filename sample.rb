require "slack-notify" 
require 'clockwork'
require 'active_support/time'


  # Here is a Clockwork method that says, "How long does it take you to process?"
  # Write the process and settings you want to send at regular intervals with slack here
 
 module Clockwork
handler do |job|
    puts "Running #{job}"

client = SlackNotify::Client.new(
  webhook_url: "https://hooks.slack.com/services/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",
  channel: "#sourcecode",
  username: "zsaszo",
  
)
client.notify("Corona Virus!")


  
  end

  # handler receives the time when job is prepared to run in the 2nd argument
  # handler do |job, time|
  #   puts "Running #{job}, at #{time}"
  # end

  every(3.seconds, 'job')
  
end